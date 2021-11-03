Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA314445B2
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Nov 2021 17:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbhKCQSf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Nov 2021 12:18:35 -0400
Received: from mail-co1nam11on2041.outbound.protection.outlook.com ([40.107.220.41]:18400
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232842AbhKCQSe (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Nov 2021 12:18:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIlPBBLAmFaVLcrSPF4HN1WblhywE5Au5hyCJ7wZ8XGOMf0l07qEcd/HDCnC4BjrvJ3Mn0lFg/TOESi1Jc8HJPidQaURxMTT0y0wR4/3ue+Q6shQJhBNN8bZU0JKbIHoos228ajbkDUJVxLtT7Ys0A2PLN+xZPc/ennvhD/jvZ7/a+ZhHkigQYtWCdkmIX1s1h32AwhSS3PfxNBrYT8eeMUDpDAriDriI61DTIwp8PbGzEjSdLQD/9gtcGqS80c926zIh2bvG9Yj20d/Ezv5iBN1Ei0nRcFiwM/5diTEAWAq5T1egRM8S9vU++zTLOdhkDucbwrXd6zFY9OjhR9V4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uczQ4artSwGIGF51M1jckKVKOi+XLDUkCXVEr8HXD1E=;
 b=JWJANvS5H44lSfdBEbDx+1oDnCF4rB8Cdcy8RWtCCZnlJIFKidB14GWELXVsEbYYSQTB6ztcZDhE+58ysZrQX452LZNbM1eycvw9Lv7W8TCW/ZZXwL/vOZa6Xc0A13/YkcBcXlKvOevJJ+AMwnbTHwTGDCiVWZuVtbh8LGzez4rOSdpemfRRkdFT/OQM9KKrLKMHLoO4YZ38DNE9CdPyMwfWcEQ35nD1FzkAUtVYs9Xg9eY68coV2V5Mkh00Ikvo97+PO/FXBrGDMoZGD0g4TOOUMFG87GeiJWyE4gJV3iSa9CWwAy0Kv2UcwXWkoqZEshQ1F1A7Rhg/vK4QIi+NmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uczQ4artSwGIGF51M1jckKVKOi+XLDUkCXVEr8HXD1E=;
 b=3gJae8slslREl+Zpypsv6V7qcU44E7lKxyQNY4viyD7nR3CNHhczTGtuNNS+FvrDyjaVzHqyX8EM2sDXL7VI/49qKpGMAOubs0JM5piKsjGBiS//43ohsNHg7UasqzCDR06ph3KZgjXG3xP/J51QvuyELQDRCLunOTrpXCMd/PE=
Received: from MW4PR03CA0058.namprd03.prod.outlook.com (2603:10b6:303:8e::33)
 by BYAPR12MB3269.namprd12.prod.outlook.com (2603:10b6:a03:12f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 16:15:55 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::b7) by MW4PR03CA0058.outlook.office365.com
 (2603:10b6:303:8e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 16:15:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 16:15:55 +0000
Received: from ethanolxb27ehost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 3 Nov
 2021 11:15:53 -0500
From:   Terry Bowman <terry.bowman@amd.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     <terry.bowman@amd.com>, <rrichter@amd.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <ssg.sos.patches@amd.com>,
        <sudheesh.mavila@amd.com>
Subject: [PATCH v2 2/4] Watchdog: sp5100_tco: Refactor MMIO base address initialization
Date:   Wed, 3 Nov 2021 11:15:19 -0500
Message-ID: <20211103161521.43447-3-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9a285a08-e370-40de-b7a6-08d99ee536b8
X-MS-TrafficTypeDiagnostic: BYAPR12MB3269:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3269085ADA509F0C9003274F838C9@BYAPR12MB3269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4l65EZHXO/P9C2tG7Hs8HAjkT5zkm3XOaqgEfxNEB41U68IEX9t1qiblu+fkJh7bKyOnZSouENWh3iKU6vriTTeHFbqI2fig23EmqbUWEvYjTRhoTOQNFJRt+1X61mASc3q3MjqMByZPba/OzeoKy26zYTgmI9OY9nBt1OajX45pw1Osc8YopnVyrzHn6tlbqn455Rh91g5XygrleUvmi/yZ4TX7R9q1zCB4O8iN7vUbhJmG36Wvbvmd1eKiyCsqx4TcpbxqnQps/3jVcbwOnrWEtGLZJyQk52bD4P8y/BBcioruTTanciWbBP5Y90EJ8x1CfeiU4k+bjR+w4ugrQG6r25r06s50g8VP2xOB3TojO1gAyQbvo++yYzAR5R6j5TyMyuNlRMaU1qC257g/EHwFYpBhguKroAk3s2E8RBvgnE8kSh2oH21KyhoRE9Ilyp93Oau2HOyJu1YknxH924+UWaQOp6aRupFmESdP/QBTCwB+62CbZVIW9drkiseM26TwI61HbAwkR3kG+a4JYOULtFIj5IuE8qC0HsbAx8nNXYANFXm82PLoCaprLPRfsvpzanCYLWBi0Qto9rPiQLlG6lwC70A1G8Qw2VAqgV9Ju4G/139Ytg4lhsV57gmFnC/WwlJOQ6tmH2KLy3jyNsSvwDJPN0wyl0tAbqj7NTaKgWEUbZFI1Uep6SdYpdiYlYlePF2qBuPeIxzYjBaSBO3XYddSylUiXSqnX8utmxM=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(26005)(356005)(16526019)(2616005)(82310400003)(81166007)(426003)(44832011)(336012)(70206006)(1076003)(6916009)(70586007)(86362001)(6666004)(2906002)(83380400001)(186003)(8676002)(316002)(7696005)(36860700001)(4326008)(47076005)(5660300002)(508600001)(36756003)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 16:15:55.0821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a285a08-e370-40de-b7a6-08d99ee536b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3269
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Move existing MMIO reservation and mapping code into helper functions. The
move locates related MMIO code together.

Also, combine MMIO base address and alternate base address discovery.
Combine based on layout type.

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Richter <rrichter@amd.com>
---
 drivers/watchdog/sp5100_tco.c | 167 +++++++++++++++++++---------------
 1 file changed, 95 insertions(+), 72 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index f5e845c3ecea..80ae42ae7aaa 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -215,6 +215,66 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
 	return val;
 }
 
+static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
+				     u32 mmio_addr,
+				     const char *dev_name)
+{
+	struct device *dev = tco->wdd.parent;
+	int ret = 0;
+
+	if (!mmio_addr)
+		return -ENOMEM;
+
+	if (!devm_request_mem_region(dev, mmio_addr,
+				    SP5100_WDT_MEM_MAP_SIZE,
+				    dev_name)) {
+		dev_dbg(dev, "MMIO address 0x%08x already in use\n",
+			mmio_addr);
+		return -EBUSY;
+	}
+
+	tco->tcobase = devm_ioremap(dev, mmio_addr,
+				    SP5100_WDT_MEM_MAP_SIZE);
+	if (!tco->tcobase) {
+		dev_dbg(dev, "MMIO address 0x%08x failed mapping.\n",
+			mmio_addr);
+		devm_release_mem_region(dev, mmio_addr,
+					SP5100_WDT_MEM_MAP_SIZE);
+		return -ENOMEM;
+	}
+
+	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n",
+		 mmio_addr);
+
+	return ret;
+}
+
+static int sp5100_tco_prepare_base(struct sp5100_tco *tco,
+				   u32 mmio_addr,
+				   u32 alt_mmio_addr,
+				   const char *dev_name)
+{
+	struct device *dev = tco->wdd.parent;
+	int ret = 0;
+
+	dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
+		mmio_addr);
+
+	/* Check MMIO address conflict */
+	ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);
+
+	/* Check alternate MMIO address conflict */
+	if (ret)
+		ret = __sp5100_tco_prepare_base(tco, alt_mmio_addr,
+						dev_name);
+
+	if (ret)
+		dev_err(dev, "Failed to reserve-map MMIO (%X) and alternate MMIO (%X) regions. ret=%X",
+			mmio_addr, alt_mmio_addr, ret);
+
+	return ret;
+}
+
 static int sp5100_tco_timer_init(struct sp5100_tco *tco)
 {
 	struct watchdog_device *wdd = &tco->wdd;
@@ -259,6 +319,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
 	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
 	const char *dev_name;
 	u32 mmio_addr = 0, val;
+	u32 alt_mmio_addr = 0;
 	int ret;
 
 	/* Request the IO ports used by this driver */
@@ -277,11 +338,35 @@ static int sp5100_tco_setupdevice(struct device *dev,
 		dev_name = SP5100_DEVNAME;
 		mmio_addr = sp5100_tco_read_pm_reg32(SP5100_PM_WATCHDOG_BASE) &
 								0xfffffff8;
+
+		/*
+		 * Secondly, Find the watchdog timer MMIO address
+		 * from SBResource_MMIO register.
+		 */
+		/* Read SBResource_MMIO from PCI config(PCI_Reg: 9Ch) */
+		pci_read_config_dword(sp5100_tco_pci,
+				      SP5100_SB_RESOURCE_MMIO_BASE,
+				      &alt_mmio_addr);
+		if (alt_mmio_addr & ((SB800_ACPI_MMIO_DECODE_EN |
+				      SB800_ACPI_MMIO_SEL) !=
+				     SB800_ACPI_MMIO_DECODE_EN)) {
+			alt_mmio_addr &= ~0xFFF;
+			alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
+		}
 		break;
 	case sb800:
 		dev_name = SB800_DEVNAME;
 		mmio_addr = sp5100_tco_read_pm_reg32(SB800_PM_WATCHDOG_BASE) &
 								0xfffffff8;
+		/* Read SBResource_MMIO from AcpiMmioEn(PM_Reg: 24h) */
+		alt_mmio_addr =
+			sp5100_tco_read_pm_reg32(SB800_PM_ACPI_MMIO_EN);
+		if (!(alt_mmio_addr & (((SB800_ACPI_MMIO_DECODE_EN |
+				       SB800_ACPI_MMIO_SEL)) !=
+		      SB800_ACPI_MMIO_DECODE_EN))) {
+			alt_mmio_addr &= ~0xFFF;
+			alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
+		}
 		break;
 	case efch:
 		dev_name = SB800_DEVNAME;
@@ -300,84 +385,22 @@ static int sp5100_tco_setupdevice(struct device *dev,
 		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
 		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
 			mmio_addr = EFCH_PM_WDT_ADDR;
-		break;
-	default:
-		return -ENODEV;
-	}
 
-	/* Check MMIO address conflict */
-	if (!mmio_addr ||
-	    !devm_request_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE,
-				     dev_name)) {
-		if (mmio_addr)
-			dev_dbg(dev, "MMIO address 0x%08x already in use\n",
-				mmio_addr);
-		switch (tco->tco_reg_layout) {
-		case sp5100:
-			/*
-			 * Secondly, Find the watchdog timer MMIO address
-			 * from SBResource_MMIO register.
-			 */
-			/* Read SBResource_MMIO from PCI config(PCI_Reg: 9Ch) */
-			pci_read_config_dword(sp5100_tco_pci,
-					      SP5100_SB_RESOURCE_MMIO_BASE,
-					      &mmio_addr);
-			if ((mmio_addr & (SB800_ACPI_MMIO_DECODE_EN |
-					  SB800_ACPI_MMIO_SEL)) !=
-						  SB800_ACPI_MMIO_DECODE_EN) {
-				ret = -ENODEV;
-				goto unreg_region;
-			}
-			mmio_addr &= ~0xFFF;
-			mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
-			break;
-		case sb800:
-			/* Read SBResource_MMIO from AcpiMmioEn(PM_Reg: 24h) */
-			mmio_addr =
-				sp5100_tco_read_pm_reg32(SB800_PM_ACPI_MMIO_EN);
-			if ((mmio_addr & (SB800_ACPI_MMIO_DECODE_EN |
-					  SB800_ACPI_MMIO_SEL)) !=
-						  SB800_ACPI_MMIO_DECODE_EN) {
-				ret = -ENODEV;
-				goto unreg_region;
-			}
-			mmio_addr &= ~0xFFF;
-			mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
-			break;
-		case efch:
-			val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
-			if (!(val & EFCH_PM_ISACONTROL_MMIOEN)) {
-				ret = -ENODEV;
-				goto unreg_region;
-			}
-			mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
-				    EFCH_PM_ACPI_MMIO_WDT_OFFSET;
-			break;
-		}
-		dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n",
-			mmio_addr);
-		if (!devm_request_mem_region(dev, mmio_addr,
-					     SP5100_WDT_MEM_MAP_SIZE,
-					     dev_name)) {
-			dev_dbg(dev, "MMIO address 0x%08x already in use\n",
-				mmio_addr);
-			ret = -EBUSY;
-			goto unreg_region;
+		val = sp5100_tco_read_pm_reg8(EFCH_PM_ISACONTROL);
+		if (val & EFCH_PM_ISACONTROL_MMIOEN) {
+			alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
+				EFCH_PM_ACPI_MMIO_WDT_OFFSET;
 		}
-	}
 
-	tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
-	if (!tco->tcobase) {
-		dev_err(dev, "failed to get tcobase address\n");
-		ret = -ENOMEM;
-		goto unreg_region;
+		break;
+	default:
+		return -ENODEV;
 	}
 
-	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);
-
-	ret = sp5100_tco_timer_init(tco);
+	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
+	if (!ret)
+		ret = sp5100_tco_timer_init(tco);
 
-unreg_region:
 	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
 	return ret;
 }
-- 
2.25.1

