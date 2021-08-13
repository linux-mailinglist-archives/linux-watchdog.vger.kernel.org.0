Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B343EBDE0
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Aug 2021 23:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhHMVdC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 13 Aug 2021 17:33:02 -0400
Received: from mail-bn8nam08on2080.outbound.protection.outlook.com ([40.107.100.80]:44641
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234547AbhHMVdC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 13 Aug 2021 17:33:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pi05rMm0M8BXqZ/CIESzxpKbTJhRPdvNgVYd57GhhJwF2FPR/qBRwAtDhmVGMoTuKNLV++/a1194S7YqqLq5s7M2vH1EmmQzoVcwIUhejQVtDwvXabv1rkdqbPB9yXh/qZY4yz9F7c26wDY8np3rGMEZnkKBQdDqSXGpL2wUycDzvo7FhzcCv9LB/tJXkR0/TPMYmoPlNn1WaCMXvXLtluoIm8QBzG/VQ6f6l9Mj/Two6xnlAaVase+/qMQf5/paE2p4olZTZc8yHYog29bGSF9GAgLwQRZGYC3X/qAbs4iFx3NfnBSxbgf+zBji0fxOjGMvKSYAKWxFRk/KOPkbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TPwQHiHlNE8BhwHP5x8+S0pGL4xZAYhMKcVrQl6t1I=;
 b=egIhHHXXU2qb4QRV3H+WY3DjrEZyKBSnDlxnv4dIVul+R5kaHj4q+V9VK01MlsHPpJk+Myx6KGUKICOTpEo8kZq5+INS2nVnMH8wBwDdsUxwc65MdEpVHU4q4SwYZcssbSfahON4tUYbojUqWSrDOdZLDFQy3NUL7pFbk0NYwsTZy4RiJG+bON+e/g9rflsEKl3qG9jQi3SUvmQvoO9Q78iPiecqa0QgHyA+EQLuuch4Wz8zFX3NUFGLNwkiwmWpDL4t50vAaZYvOEjNIpbMjSrBsYxYmLtkoia98qQ5n/auela8yD13PJVJQVFF33EmTe0hXStajIt6hEEPogyamA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TPwQHiHlNE8BhwHP5x8+S0pGL4xZAYhMKcVrQl6t1I=;
 b=jo3FFvofTG2g2sDj2lDFqP+U2jkW91wzj9ixNoPlFavHSdxIXHQyz7KxzGbdpr0oMl1FcsI5BzkYMrGhVBwbXNbsG+83QVwOOfCRb0LavnkP+qfZEepJxziVwDqg8F6SaJD6Oj23YIkvE/fuD8bCcL0lK7cGmaZkYnNLhtI9uzU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9)
 by SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Fri, 13 Aug
 2021 21:32:33 +0000
Received: from SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998]) by SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998%4]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 21:32:33 +0000
From:   Terry Bowman <Terry.Bowman@amd.com>
To:     linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-kernel@vger.kernel.org, rrichter@amd.com,
        terry.bowman@amd.com
Subject: [PATCH] Watchdog: sp5100_tco: Replace watchdog cd6h/cd7h port I/O accesses with MMIO accesses
Date:   Fri, 13 Aug 2021 16:32:15 -0500
Message-Id: <20210813213216.54780-1-Terry.Bowman@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0306.namprd03.prod.outlook.com
 (2603:10b6:408:112::11) To SA0PR12MB4512.namprd12.prod.outlook.com
 (2603:10b6:806:71::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ethanolxb27ehost.amd.com (165.204.184.1) by BN9PR03CA0306.namprd03.prod.outlook.com (2603:10b6:408:112::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 21:32:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdb4c798-ac78-4d15-58be-08d95ea1dc40
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45574C69D8A9E5E35E3F136583FA9@SA0PR12MB4557.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BaZE3qVplHndMnEo6oGKbGy6ZDOIcJjxrkR1ug7iUG3Y6SqIZ1ZyMsAjhmcXodbKgnTNBASUmOH3WT7VTUlRnhiIG9NfFqHI4r37l85Q9QNsvFE9hx5mK8bMqBPhIY8UJcBp1ovYth2d+nK/0WeKuUZuO7h8N3bK/AUEenN5/Z6bjOn23xCeIaWiJe0xUlga4JubUICFJ6C8yPDjFwnFnnqTN9IkxobTGr7Iiuljt2nZSS4UOKza3PtcgAuUZ2Q0MPpZ6oFtZ2LI+0YQkzF5+w2EYhcAVUxz0vGNwxvucYiECBiAPa5jLjYZ19I8m9rYEIKfL0Vr19XJoIeo7dMwFQtLfRnrVaYnBmuRVrJJG4ChjMH84gxyQY+OgJdmaniQVkPkI8KP5hbjcx3ryWP+DxvyUK/2Iq6BMO4zG1SOoZALlQEgMc/kdid6tiUUhOZfG3Ynf1qLtHfhHj//NpJBIqs8tv9j5CAEmiqPFXp6GfqM/31sRXP2Bfftp+FezffyKPCpNFyQIC8UlvWa06KZ4XySonyeFYnvanrE/E+AnvO/EswSDhEAoEr+o2YRCDdt2psKUZKyBKQ8qGRt+23xzT6rWvV+5IO5FtU5uii0no1R7QkRehAecXDdQgbq91JWk5h0IZh7NipqW7mOB2V+NtJj5aXXH7P1AqA1KrhqgOZydCGD2YAFhNYAL+LwGcFViuMg02j9aTUofMJVLa6MbwmOlYBeZia1o/Et5gy/6Yc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(66946007)(2616005)(66476007)(66556008)(6916009)(478600001)(956004)(5660300002)(6486002)(8936002)(38350700002)(38100700002)(52116002)(7696005)(8676002)(2906002)(4326008)(83380400001)(316002)(86362001)(6666004)(1076003)(26005)(36756003)(186003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b8Sk1tI6j/3ioqvOO3Ep+Q56umLBEZ+P2SG9rF4+GrUYX76EGlCAcfYzyAsj?=
 =?us-ascii?Q?rU8ARIgR+17azQiOUiPS5NiDtvLUAanTLu3l7fNZ7HMmNvVUppvhBspCEOwn?=
 =?us-ascii?Q?TGTaMB8LedXEse8YEVS/GT0jPutYBtVFTZkhKsUY/SBoJ++sTagN0mTRRNpv?=
 =?us-ascii?Q?EbKP4vtC+60Gn+JeseqNsqA1tl5znC7eOrOfWuw1AW87vuH9HQvTGsktiR+v?=
 =?us-ascii?Q?RFBiFcd32MB5ezp24kEOfzg3oR794i0Ij7pDYN2IEL0DazE4s/5KF76QQggE?=
 =?us-ascii?Q?uUk1L+EhlOBQxfKaNnj58TCjrAdv88q03uPX9w2KyJdsl4kFSwJg4NJstHbU?=
 =?us-ascii?Q?rUaErAb3P9l37pV9wJbI027LFpinO0UPZmffLgjuL8nFFELCprECfBspNqeL?=
 =?us-ascii?Q?dJyhgMueZ9lvo48D+5jmE93uJTSEIp7KQjTX/GxIV1sNdUh7bHgn1MMqgzdO?=
 =?us-ascii?Q?iUGtlrBCPg0EiN1xeu8ka6or9UaUN0mDEqM159d2nJqHGJAdcEAy7f/J8SZm?=
 =?us-ascii?Q?SFo3W6Qh/g/gmFOtAuw4A1zN39C2JCb19LzdrtllXouB5715bKFirWyOn0VU?=
 =?us-ascii?Q?U86axB1ANrgZ7cG6y5FR1IA8jBj8CNcZ/dxkHK7CriWYycPh5HoHg9i0fC7M?=
 =?us-ascii?Q?GX31q5zYjE0lvrWxWJuIelr78oM+B3btoUBa4rGq4kYk6XQogaZ8pi8LzD+q?=
 =?us-ascii?Q?4WoAHhr3Oa1CZ+2BkfQxR+661BnAjXk5YJ7WSOS1zD2ijeP6wzWxsfg8gB20?=
 =?us-ascii?Q?8fo+19fKKvgLj7m8uFPOxAL1XufjPJW4HY7r32mLQa2t0bQmHN2Bvx4x08YI?=
 =?us-ascii?Q?2KYKfpLa48DXis/KVbn6VSAeZTerT5RfXbXwDylxby27aWLmTkcOmVtgjo+G?=
 =?us-ascii?Q?Y79n5xaVx3egjLvTf9GNqg6L7ulkid6iPr4zc+gob7qMLaZNb5e9tUNhmIYt?=
 =?us-ascii?Q?uuzIHheEme5EuBEbV26MlaPx0RLwfd8QpN637XBY90/YIvjmX0MWqWkd/M/1?=
 =?us-ascii?Q?jLy4Yq5bhMR6acFQYVFod+FmkL3j/nG5wRKs8qfa3mK6Y4FLn7/kgZoT7OdE?=
 =?us-ascii?Q?JZnARRR6/NBfFFyRy7Opm3V+v+i8tKfg+Qbkdn/F9lFiarBpqTTJfdfdw9te?=
 =?us-ascii?Q?33uudUJk2ipEMWTVs6bqLhEme3phmi04o9TKKtxI6tX4nKnjTEXqRNaF+rlC?=
 =?us-ascii?Q?AeQMYWNKIiIY+UdETc9K1PcLc44o+Xu9rMilgp3qQdIwSeUl+3rxmn3wdQIB?=
 =?us-ascii?Q?Uze9Yr/O5QC+VLS1uIeFmDA7ZX0GVM5efsA/HreUUtm99Lx3uSRuJ/vBusEB?=
 =?us-ascii?Q?vDPHWXcpOH30OFFgE4NLz5yw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb4c798-ac78-4d15-58be-08d95ea1dc40
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4512.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 21:32:32.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVuPzY2PtcYucWZBt/t2caNrjic7pMLGEviVeLQur7hiX2fmihzl84ucpZmfKitukA5aGio4x0Ck//JZ9e8aFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4557
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use MMIO instead of port I/O during SMBus controller address discovery.
Also, update how EFCH capability is determined by replacing a family check
with a PCI revision ID check.

cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read accesses to
disabled cd6h/cd7h port I/O will return F's and written data is dropped.
The recommended workaround to handle disabled cd6h/cd7h port I/O is
replacing port I/O with MMIO accesses. The MMIO access method has been
available since at least SMBus controllers using PCI revision 0x59.

The sp5100_tco driver uses a CPU family match of 17h to determine 
EFCH_PM_DECODEEN_WDT_TMREN register support. Using a family check requires
driver updates for each new AMD CPU family following 17h. This patch
replaces the family check with a check for SMBus PCI revision ID 0x59 and
later. Note: Family 17h processors use SMBus PCI revision ID 0x59. The
intent is to use the PCI revision ID check to support future AMD processors
while minimizing required driver changes. The caveat with this change is
the sp5100_tco driver must be updated if a new AMD processor family changes
the EFCH design or the SMBus PCI ID value doesn't follow this pattern.

Tested with forced WDT reset using `cat >> /dev/watchdog`.

Signed-off-by: Terry Bowman <Terry.Bowman@amd.com>
Reviewed-by: Robert Richter <rrichter@amd.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/sp5100_tco.c | 180 +++++++++++++++++++++++++++-------
 drivers/watchdog/sp5100_tco.h |   5 +
 2 files changed, 148 insertions(+), 37 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index a730ecbf78cd..cf1d0d96a731 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -44,6 +44,7 @@
 #include "sp5100_tco.h"
 
 #define TCO_DRIVER_NAME	"sp5100-tco"
+#define AMD_PCI_SMBUS_REVISION_MMIO             0x59
 
 /* internal variables */
 
@@ -51,6 +52,11 @@ enum tco_reg_layout {
 	sp5100, sb800, efch
 };
 
+struct efch_cfg {
+	void __iomem *addr;
+	struct resource *res;
+};
+
 struct sp5100_tco {
 	struct watchdog_device wdd;
 	void __iomem *tcobase;
@@ -161,7 +167,133 @@ static void sp5100_tco_update_pm_reg8(u8 index, u8 reset, u8 set)
 	outb(val, SP5100_IO_PM_DATA_REG);
 }
 
-static void tco_timer_enable(struct sp5100_tco *tco)
+static bool efch_use_mmio(void)
+{
+	return (sp5100_tco_pci->vendor == PCI_VENDOR_ID_AMD &&
+		sp5100_tco_pci->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
+		sp5100_tco_pci->revision >= AMD_PCI_SMBUS_REVISION_MMIO);
+}
+
+static u8 efch_read_pm_reg8(struct efch_cfg *cfg, u8 index)
+{
+	if (!cfg->addr)
+		return sp5100_tco_read_pm_reg8(index);
+
+	return readb(cfg->addr + index);
+}
+
+static void efch_update_pm_reg8(struct efch_cfg *cfg,
+				u8 index, u8 reset, u8 set)
+{
+	u8 val;
+
+	if (!cfg->addr) {
+		sp5100_tco_update_pm_reg8(index, reset, set);
+		return;
+	}
+
+	val = readb(cfg->addr + index);
+	val &= reset;
+	val |= set;
+	writeb(val, cfg->addr + index);
+}
+
+/* Return SMBus controller's MMIO address on success and 0 on error. */
+static u32 efch_setup_mmio_addr(struct efch_cfg *cfg)
+{
+	/*
+	 * On EFCH devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
+	 * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
+	 * region, it also enables the watchdog itself.
+	 * If mmio is enbaled then the WDT needs to be started if not
+	 * already started.
+	 */
+	if (cfg->addr) {
+		if (!(efch_read_pm_reg8(cfg, EFCH_PM_DECODEEN) &
+		      EFCH_PM_DECODEEN_WDT_TMREN)) {
+			efch_update_pm_reg8(cfg, EFCH_PM_DECODEEN,
+					    0xff,
+					    EFCH_PM_DECODEEN_WDT_TMREN);
+		}
+	}
+
+	if (!(efch_read_pm_reg8(cfg, EFCH_PM_DECODEEN) &
+	      EFCH_PM_DECODEEN_WDT_TMREN))
+		return 0;
+
+	return EFCH_PM_WDT_ADDR;
+}
+
+/*
+ * Return SMBus controller's alternate MMIO address on success and 0 on
+ * error.
+ *
+ * The alternate SMBus MMIO address is necessary if the address
+ * returned from efch_setup_mmio_addr() is unreadable or the space
+ * reservation fails.
+ */
+static u32 efch_setup_alt_mmio_addr(struct efch_cfg *cfg)
+{
+	if (!(efch_read_pm_reg8(cfg, EFCH_PM_ISACONTROL) &
+	      EFCH_PM_ISACONTROL_MMIOEN))
+		return 0;
+
+	return EFCH_PM_ACPI_MMIO_ADDR + EFCH_PM_ACPI_MMIO_WDT_OFFSET;
+}
+
+static int sp5100_region_setup(struct device *dev, struct efch_cfg *cfg)
+{
+	if (efch_use_mmio()) {
+		struct resource *res;
+		void __iomem *addr;
+
+		res = request_mem_region(EFCH_PM_ACPI_MMIO_PM_ADDR,
+					 EFCH_PM_ACPI_MMIO_PM_SIZE,
+					 "sp5100_tco");
+		if (!res) {
+			dev_err(dev,
+				"SMB base address memory region 0x%x already in use.\n",
+				EFCH_PM_ACPI_MMIO_PM_ADDR);
+			return -EBUSY;
+		}
+
+		addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR,
+			       EFCH_PM_ACPI_MMIO_PM_SIZE);
+		if (!addr) {
+			release_resource(res);
+			dev_err(dev, "SMB base address mapping failed.\n");
+			return -ENOMEM;
+		}
+
+		cfg->res = res;
+		cfg->addr = addr;
+		return 0;
+	}
+
+	/* Request the IO ports used by this driver */
+	if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
+				  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
+		dev_err(dev, "I/O address 0x%04x already in use\n",
+			SP5100_IO_PM_INDEX_REG);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void sp5100_region_release(struct efch_cfg *cfg)
+{
+	if (!cfg->addr) {
+		release_region(SP5100_IO_PM_INDEX_REG,
+			       SP5100_PM_IOPORTS_SIZE);
+		return;
+	}
+
+	iounmap(cfg->addr);
+	release_resource(cfg->res);
+}
+
+static void tco_timer_enable(struct sp5100_tco *tco, struct efch_cfg *cfg)
 {
 	u32 val;
 
@@ -197,9 +326,9 @@ static void tco_timer_enable(struct sp5100_tco *tco)
 		break;
 	case efch:
 		/* Set the Watchdog timer resolution to 1 sec and enable */
-		sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN3,
-					  ~EFCH_PM_WATCHDOG_DISABLE,
-					  EFCH_PM_DECODEEN_SECOND_RES);
+		efch_update_pm_reg8(cfg, EFCH_PM_DECODEEN3,
+				    ~EFCH_PM_WATCHDOG_DISABLE,
+				    EFCH_PM_DECODEEN_SECOND_RES);
 		break;
 	}
 }
@@ -219,17 +348,14 @@ static int sp5100_tco_setupdevice(struct device *dev,
 				  struct watchdog_device *wdd)
 {
 	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
+	struct efch_cfg cfg = {0};
 	const char *dev_name;
-	u32 mmio_addr = 0, val;
+	u32 mmio_addr, val;
 	int ret;
 
-	/* Request the IO ports used by this driver */
-	if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
-				  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
-		dev_err(dev, "I/O address 0x%04x already in use\n",
-			SP5100_IO_PM_INDEX_REG);
-		return -EBUSY;
-	}
+	ret = sp5100_region_setup(dev, &cfg);
+	if (ret)
+		return ret;
 
 	/*
 	 * Determine type of southbridge chipset.
@@ -247,21 +373,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
 		break;
 	case efch:
 		dev_name = SB800_DEVNAME;
-		/*
-		 * On Family 17h devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
-		 * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
-		 * region, it also enables the watchdog itself.
-		 */
-		if (boot_cpu_data.x86 == 0x17) {
-			val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
-			if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
-				sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN, 0xff,
-							  EFCH_PM_DECODEEN_WDT_TMREN);
-			}
-		}
-		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
-		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
-			mmio_addr = EFCH_PM_WDT_ADDR;
+		mmio_addr = efch_setup_mmio_addr(&cfg);
 		break;
 	default:
 		return -ENODEV;
@@ -307,13 +419,11 @@ static int sp5100_tco_setupdevice(struct device *dev,
 			mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
 			break;
 		case efch:
-			val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
-			if (!(val & EFCH_PM_ISACONTROL_MMIOEN)) {
+			mmio_addr = efch_setup_alt_mmio_addr(&cfg);
+			if (!mmio_addr) {
 				ret = -ENODEV;
 				goto unreg_region;
 			}
-			mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
-				    EFCH_PM_ACPI_MMIO_WDT_OFFSET;
 			break;
 		}
 		dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
@@ -338,7 +448,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
 	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);
 
 	/* Setup the watchdog timer */
-	tco_timer_enable(tco);
+	tco_timer_enable(tco, &cfg);
 
 	val = readl(SP5100_WDT_CONTROL(tco->tcobase));
 	if (val & SP5100_WDT_DISABLED) {
@@ -366,12 +476,8 @@ static int sp5100_tco_setupdevice(struct device *dev,
 	 */
 	tco_timer_stop(wdd);
 
-	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
-
-	return 0;
-
 unreg_region:
-	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
+	sp5100_region_release(&cfg);
 	return ret;
 }
 
diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
index adf015aa4126..2df8f8b2c55b 100644
--- a/drivers/watchdog/sp5100_tco.h
+++ b/drivers/watchdog/sp5100_tco.h
@@ -83,3 +83,8 @@
 
 #define EFCH_PM_ACPI_MMIO_ADDR		0xfed80000
 #define EFCH_PM_ACPI_MMIO_WDT_OFFSET	0x00000b00
+#define EFCH_PM_ACPI_MMIO_PM_OFFSET	0x00000300
+
+#define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
+					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
+#define EFCH_PM_ACPI_MMIO_PM_SIZE       8
-- 
2.25.1

