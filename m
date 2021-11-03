Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEE44445B9
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Nov 2021 17:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbhKCQS7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Nov 2021 12:18:59 -0400
Received: from mail-sn1anam02on2053.outbound.protection.outlook.com ([40.107.96.53]:11141
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232564AbhKCQS5 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Nov 2021 12:18:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnN1GLMluJUQ4azIKxu3DDrgKcyoKdzCD5tZsFjG4n+QIO0/TK/xNIL+9OrdVYEyXd4EHXurNhXd4/GYft8MVdP0a/Hr9XnvwsfUh7AP8ODCjiKppHqKfjim13MeUw9lYV35nb4eSQ5OBk9xvnD9R7sn2muKcUcoRUCxRQt3TuuA/Yr94Z0e1jmaa6amOee9+hkkEpHsSMC5fXJtuFPrcY0I/PL7ZJMe8ldQYH+hG8FDXe1K9SiJVzFwTcP9MEn9igwx/eslhozUj7FEE0EFUQFY8TtGrMfkevT3T0LJO5EbVt21usW+AatM3+aSSERJcYPCiGFNJicR9k9IID4prw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u60/GfImBr2IYT7IEJQ5aRtsITuf/3PPINYU2LETxSU=;
 b=WvxiRuwXjvaKt1k5ysnu3fgiAujTwJL4fijXloIP99ffMO324GUsMHj6LVwJlOJ7bjmEPIx+uJj0uJZhhCQ2USqmFwyolfVKl7dzb2a8PqqB6A1gTPlgBBvLftgUIWG62+3z6wKLgE/P4/sfV7fMl9IAo/H5so6RHigJ6nJ9IMTWGpDgf1mlukJ1EK5d0njvpOGlBc4XIGw8uYxz6oq+tUN3OPGxGPMOju7Tz4eiwU52dBqKP7/G3wmQl5V2wdh1PTeBKTTV2sg74o0J5PZr8QucQJf220aleczR6AuRy+4KOxd3320h82No9seX6wsbVbjd2/H0gvA/Op282Ej5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u60/GfImBr2IYT7IEJQ5aRtsITuf/3PPINYU2LETxSU=;
 b=bv+CbDmtyAa3RgyhNfsgAy2moMhS1hqYZC2qFjpiamsRoDZ7itMe9CYBcYpTwKtN5cv2P13LF/VTEBXWj6dmBMi6lLgM78uF8zlK4bxSCls3B1F69xBwc40DkISXTi2RSNpQC5S/TuGwMkBarKoCWK2rt67DWwrA4bv3qBPfGAM=
Received: from BN9PR03CA0368.namprd03.prod.outlook.com (2603:10b6:408:f7::13)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 16:16:19 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::76) by BN9PR03CA0368.outlook.office365.com
 (2603:10b6:408:f7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 16:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 16:16:19 +0000
Received: from ethanolxb27ehost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 3 Nov
 2021 11:16:18 -0500
From:   Terry Bowman <terry.bowman@amd.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     <terry.bowman@amd.com>, <rrichter@amd.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <ssg.sos.patches@amd.com>,
        <sudheesh.mavila@amd.com>
Subject: [PATCH v2 4/4] Watchdog: sp5100_tco: Enable Family 17h+ CPUs
Date:   Wed, 3 Nov 2021 11:15:21 -0500
Message-ID: <20211103161521.43447-5-terry.bowman@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103161521.43447-1-terry.bowman@amd.com>
References: <20211103161521.43447-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbc75838-9654-4cd2-fbcb-08d99ee5450e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41923F4EBEF80D7BD94D6649838C9@MN2PR12MB4192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S95VmdzHod7Vl/GLPxgGGhSKub9vubfk7nchskZQp87Kbg4pVbWTMubot1307FNagrGXt+PgolI3iVNa0L40O6Z0xnmqPD9JBajX0B5rSOV2E4J+q5w61XVC7qCfp+lKYtV8LNfGpiZp57/YLg5Xj0F6YQ1vMisAJ8XTI5yYWL+iNoPsBpICVrWW759suls8QWat9WcY9xpPe39UoLsMOrFgqHZjLUv9pTc4/CqtrUlJJSScgCn2uHuoaBX/A9Ojh3XGe1NYmULEBdx8ycNhZ8aLzCoNAM46Zs2n+sx9G1SDQGEbXM+VL8XllQQjU8BEpWMDv4YGOjze33R2UNYsI/AYfwcJF0ffhM5opblJpasjXIsKd4SDM+iXB4o+yF0S4rBy2Z5PL5JuDxHbXEnnAjnY7NdulZeTkvkOc9lqR1RKhvJsZ/fgk4UNjkojK9pX2R53TD2HvuCZnYWVOqpLACC9OeYFj7IWp9iC2XA8Cj3bI1DT7QywNeK736MiAZ2JBvd3IJvlOwRB8JoYNYAjqbPecymPsiQWwyeNazVA89D7JZkMRYVZnA8pLre8/NtH2cbA7hbKFSrkKKKzgQ/EdUWqLoKFw2Q7EQdgtEjg2HZUZYcndVvj9RpknC016+b2Bx2htGaNlZklNSDvoczMAtZHz8wyvMBraEHYz01GcCGIA25C2Vhc36SlGRMW9rO4+RaapYwbUHuLF8EnMVDWSobCYIzhSAzgz79ra9NoHCE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(8936002)(186003)(36756003)(16526019)(26005)(36860700001)(6916009)(316002)(54906003)(336012)(426003)(6666004)(70206006)(4326008)(1076003)(81166007)(83380400001)(7696005)(70586007)(86362001)(508600001)(82310400003)(2906002)(5660300002)(44832011)(8676002)(356005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 16:16:19.2495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc75838-9654-4cd2-fbcb-08d99ee5450e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The driver currently uses a CPU family match of 17h to determine
EFCH_PM_DECODEEN_WDT_TMREN register support. This family check will not
support future AMD CPUs and instead will require driver updates to add
support.

Remove the Fam17h family check and add a check for SMBus PCI revision ID
0x59. This will support Fam17h and future AMD processors including EFCH
functionality without requiring driver changes.

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Richter <rrichter@amd.com>
---
 drivers/watchdog/sp5100_tco.c | 16 ++++------------
 drivers/watchdog/sp5100_tco.h |  2 +-
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index 4777e672a8ad..8930b94aae47 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -87,6 +87,10 @@ static enum tco_reg_layout tco_reg_layout(struct pci_dev *dev)
 	    dev->device == PCI_DEVICE_ID_ATI_SBX00_SMBUS &&
 	    dev->revision < 0x40) {
 		return sp5100;
+	} else if (dev->vendor == PCI_VENDOR_ID_AMD &&
+	    sp5100_tco_pci->device == PCI_DEVICE_ID_AMD_KERNCZ_SMBUS &&
+	    sp5100_tco_pci->revision >= AMD_ZEN_SMBUS_PCI_REV) {
+		return efch_mmio;
 	} else if (dev->vendor == PCI_VENDOR_ID_AMD &&
 	    ((dev->device == PCI_DEVICE_ID_AMD_HUDSON2_SMBUS &&
 	     dev->revision >= 0x41) ||
@@ -472,18 +476,6 @@ static int sp5100_tco_setupdevice(struct device *dev,
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
 		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
 		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
 			mmio_addr = EFCH_PM_WDT_ADDR;
diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
index 73f179a1d6e5..3a37bffc96b4 100644
--- a/drivers/watchdog/sp5100_tco.h
+++ b/drivers/watchdog/sp5100_tco.h
@@ -88,4 +88,4 @@
 #define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
 					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
 #define EFCH_PM_ACPI_MMIO_PM_SIZE       8
-
+#define AMD_ZEN_SMBUS_PCI_REV           0x59
-- 
2.25.1

