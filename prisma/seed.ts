import { PrismaClient } from '@prisma/client'
import { hash } from 'bcrypt'
import { createUsersOrdersAndCartSeed } from '../src/actions/createUsersOrdersAndCartSeed'
import createManyProductsSeed from '../src/actions/createManyProductsSeed'
const prismaDb = new PrismaClient()

async function main () {
  const superAdminAlreadyExists = await prismaDb.superAdmin.findFirst({
    where: {
      email: process.env.SUPER_ADMIN_EMAIL
    }
  })

  if (
    process.env.SUPER_ADMIN_PASSWORD &&
    process.env.SUPER_ADMIN_EMAIL &&
    process.env.SUPER_ADMIN_NAME &&
    !superAdminAlreadyExists
  ) {
    const password = process.env.SUPER_ADMIN_PASSWORD
    const hashPassword = await hash(password, 10)
    await prismaDb.superAdmin.create({
      data: {
        name: process.env.SUPER_ADMIN_NAME,
        email: process.env.SUPER_ADMIN_EMAIL,
        hashedPassword: hashPassword
      }
    })
  }
  await createManyProductsSeed()
  await createUsersOrdersAndCartSeed()
}
main()
  .then(async () => {
    await prismaDb.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prismaDb.$disconnect()
    process.exit(1)
  })
