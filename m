Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B972C4445B7
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Nov 2021 17:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232895AbhKCQSx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Nov 2021 12:18:53 -0400
Received: from mail-co1nam11on2057.outbound.protection.outlook.com ([40.107.220.57]:57697
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232564AbhKCQSq (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Nov 2021 12:18:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRQMtl21+z3KOxF3H3/eW+/nwlBabURwRUxRNdJ6lV+dYDExyk37CkSpPK/atqCZ94kO4m6DWHBUtkN/Yufyr4O5b7zBSctDcKYf3OcDpSzjywt199GiOhwQmNFBgPg1wiQ3/uQSrULLWLcdhXSJKWZ3x+Br/GsQLMaWp2eQTAyUjgXqdSvINs0ketkK68htuclZTX0JiGvYK+lbloO9XoxHEtAYy6VtfQkODdgj9TWGqNDKBpHXiRtWC9cPAf8J/5IAeXXbL4MG4/pPIQQKMp2imfueZLXz3dNHveDCrR0577c9wnITuUxCRRXqIzZr/JA151v443NrgOivwPCP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y079BTXQmB5UJxQwKloQci7cPOH1syP1fMteMaOsMYM=;
 b=OBb3c80Vn6LMrtOvO7vVtklnlbAencxGadKD1u2Pc6AJWwAMdxKutC3YeYOKDLd6NMRHSMO1cNZeca/DFydSLfF+7Bha1v7MW1u4zhIT5fSd/USXPmZ69y7O5K5XLnpotZ4L1j17j8cJJTmFO0JSH+E6bz2blDlZaIN+IBAvdv5iqCaSy9k3qNCL67OpcEgHhPE3eCnmCQJ0MIY9glsQnd6YbHWq6v9emi6Ae92FsmLShwAYSYkmrJ4DIfJo2+y2KaywkhpCH/uU7tif1DtpbAy91EfjQyjW4aE++rrjtCeTVVXKFFbYasnHLtdJPPLcOPDlKT62U/7z5qKK+gLMxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y079BTXQmB5UJxQwKloQci7cPOH1syP1fMteMaOsMYM=;
 b=foZC5CVu9zJ2vztIlQgpX5722TeRohj+xWSEEFw6ibhMSKp7ro+OUUDl1VVf70COnMsxPrBPDoTSQgqWXtyt1bdSfHm5Dgg6dpvnBQWYhOWNfmTkJDiwTskHth5ra6d8tmRTB4wcaP/zPPXjJrrtjUCGBXR6wffflaaaAj2U+sQ=
Received: from MW4PR04CA0376.namprd04.prod.outlook.com (2603:10b6:303:81::21)
 by MWHPR12MB1230.namprd12.prod.outlook.com (2603:10b6:300:f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 16:16:06 +0000
Received: from CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::75) by MW4PR04CA0376.outlook.office365.com
 (2603:10b6:303:81::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 16:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT063.mail.protection.outlook.com (10.13.175.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 16:16:06 +0000
Received: from ethanolxb27ehost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 3 Nov
 2021 11:16:05 -0500
From:   Terry Bowman <terry.bowman@amd.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     <terry.bowman@amd.com>, <rrichter@amd.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <ssg.sos.patches@amd.com>,
        <sudheesh.mavila@amd.com>
Subject: [PATCH v2 3/4] Watchdog: sp5100_tco: Add EFCH SMBus controller initialization using MMIO
Date:   Wed, 3 Nov 2021 11:15:20 -0500
Message-ID: <20211103161521.43447-4-terry.bowman@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ae91efbc-7f10-446b-3464-08d99ee53d71
X-MS-TrafficTypeDiagnostic: MWHPR12MB1230:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1230003830ACDD2972B2B791838C9@MWHPR12MB1230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qINzIJLZFwjBwn9CF/L1Cmp5aEuhSOppxdUNK7j74AsswlwGZJuKfbvkYxRWU86KayiymfhIaNOUuXqiEA5JXwYLLTB2JmZJYcUhqrXrKgC1HvhrxPFOSuLW83drzLICmE3kYI0J69E6G6t/o3bZMwYrK/cDqf5b3GJMvnITC9jqpZmeBZb9dqX1u73baxwWZkOz/GidvI+6pos2urbkaTNsUfF5ZulzFXdeenMcNHIpmPZISLKuAexYi2UdsyHdyfYr5zQhz5aJWsLwPSAhdNHs8A2sKWl9/RVsFrUK5fqiMyu04G7mVlwyT9HD5yBFeYpXEjwsDYa2RmYvtNaGOwnyQn3Pkx4HMtWqqrxBqEtGO9uSLpcNCiS9QHdPc9w0ZvrekEbMphW2cHlrAW8lvgTQvfBgjCxwp1vNgfRKL4IXg4WPVLOph1rpwWO8VPnxTI8f4dk6PEQF/eJRZBQfh+J9Qvsl3gMUJT/Zyzo58TPSiAKiJ0qUu6hFkJYH0n5lDMGDKQzf1xbfKfUOPVbf7EFKOW7qg17wsph035bK9QSkShcRIc9Z2SKkScmP3L9TZO8G2tU3kjOJ4LBdTcc90gdh0NX3GCYeh+Ir/MIysi/WdbIVxqTNcXLfgi25TiJk8/yKfa9TFOLSrS3U2voC/m5RPtp5F2zAzMQPqnRS1RSheIgQRMveTRgmpJZybFjbxiKC9xjNGGe7YLyQm55W/sRORIr1uSZqBdQtGpqlfh8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6916009)(1076003)(81166007)(508600001)(8936002)(356005)(316002)(44832011)(36756003)(54906003)(6666004)(26005)(70206006)(70586007)(8676002)(186003)(336012)(86362001)(82310400003)(83380400001)(16526019)(47076005)(2616005)(2906002)(7696005)(4326008)(5660300002)(426003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 16:16:06.3505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae91efbc-7f10-446b-3464-08d99ee53d71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1230
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read accesses to
disabled cd6h/cd7h port I/O will return F's and written data is dropped.

The recommended workaround to handle disabled cd6h/cd7h port I/O is
replacing port I/O with MMIO accesses. The MMIO access method has been
available since at least SMBus controllers using PCI revision 0x59.

The EFCH MMIO path is enabled in later patch.

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Richter <rrichter@amd.com>
---
 drivers/watchdog/sp5100_tco.c | 104 +++++++++++++++++++++++++++++++++-
 drivers/watchdog/sp5100_tco.h |   6 ++
 2 files changed, 109 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index 80ae42ae7aaa..4777e672a8ad 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -48,12 +48,14 @@
 /* internal variables */
 
 enum tco_reg_layout {
-	sp5100, sb800, efch
+	sp5100, sb800, efch, efch_mmio
 };
 
 struct sp5100_tco {
 	struct watchdog_device wdd;
 	void __iomem *tcobase;
+	void __iomem *addr;
+	struct resource *res;
 	enum tco_reg_layout tco_reg_layout;
 };
 
@@ -161,6 +163,59 @@ static void sp5100_tco_update_pm_reg8(u8 index, u8 reset, u8 set)
 	outb(val, SP5100_IO_PM_DATA_REG);
 }
 
+static int sp5100_request_region_mmio(struct device *dev,
+				      struct watchdog_device *wdd)
+{
+	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
+	struct resource *res;
+	void __iomem *addr;
+
+	res = request_mem_region(EFCH_PM_ACPI_MMIO_PM_ADDR,
+				 EFCH_PM_ACPI_MMIO_PM_SIZE,
+				 "sp5100_tco");
+
+	if (!res) {
+		dev_err(dev,
+			"SMB base address memory region 0x%x already in use.\n",
+			EFCH_PM_ACPI_MMIO_PM_ADDR);
+		return -EBUSY;
+	}
+
+	addr = ioremap(EFCH_PM_ACPI_MMIO_PM_ADDR,
+		       EFCH_PM_ACPI_MMIO_PM_SIZE);
+	if (!addr) {
+		release_resource(res);
+		dev_err(dev, "SMB base address mapping failed.\n");
+		return -ENOMEM;
+	}
+
+	tco->res = res;
+	tco->addr = addr;
+	return 0;
+}
+
+static void sp5100_release_region_mmio(struct sp5100_tco *tco)
+{
+	iounmap(tco->addr);
+	release_resource(tco->res);
+}
+
+static u8 efch_read_pm_reg8(struct sp5100_tco *tco, u8 index)
+{
+	return readb(tco->addr + index);
+}
+
+static void efch_update_pm_reg8(struct sp5100_tco *tco,
+				u8 index, u8 reset, u8 set)
+{
+	u8 val;
+
+	val = readb(tco->addr + index);
+	val &= reset;
+	val |= set;
+	writeb(val, tco->addr + index);
+}
+
 static void tco_timer_enable(struct sp5100_tco *tco)
 {
 	u32 val;
@@ -201,6 +256,12 @@ static void tco_timer_enable(struct sp5100_tco *tco)
 					  ~EFCH_PM_WATCHDOG_DISABLE,
 					  EFCH_PM_DECODEEN_SECOND_RES);
 		break;
+	case efch_mmio:
+		/* Set the Watchdog timer resolution to 1 sec and enable */
+		efch_update_pm_reg8(tco, EFCH_PM_DECODEEN3,
+				    ~EFCH_PM_WATCHDOG_DISABLE,
+				    EFCH_PM_DECODEEN_SECOND_RES);
+		break;
 	}
 }
 
@@ -313,6 +374,44 @@ static int sp5100_tco_timer_init(struct sp5100_tco *tco)
 	return 0;
 }
 
+static int sp5100_tco_setupdevice_mmio(struct device *dev,
+				       struct watchdog_device *wdd)
+{
+	struct sp5100_tco *tco = watchdog_get_drvdata(wdd);
+	const char *dev_name = SB800_DEVNAME;
+	u32 mmio_addr = 0, alt_mmio_addr = 0;
+	int ret;
+
+	ret = sp5100_request_region_mmio(dev, wdd);
+	if (ret)
+		return ret;
+
+	/* Determine MMIO base address */
+	if (!(efch_read_pm_reg8(tco, EFCH_PM_DECODEEN) &
+	      EFCH_PM_DECODEEN_WDT_TMREN)) {
+		efch_update_pm_reg8(tco, EFCH_PM_DECODEEN,
+				    0xff,
+				    EFCH_PM_DECODEEN_WDT_TMREN);
+	}
+
+	if (efch_read_pm_reg8(tco, EFCH_PM_DECODEEN) &
+	    EFCH_PM_DECODEEN_WDT_TMREN)
+		mmio_addr = EFCH_PM_WDT_ADDR;
+
+	/* Determine alternate MMIO base address */
+	if (efch_read_pm_reg8(tco, EFCH_PM_ISACONTROL) &
+	    EFCH_PM_ISACONTROL_MMIOEN)
+		alt_mmio_addr = EFCH_PM_ACPI_MMIO_ADDR +
+			EFCH_PM_ACPI_MMIO_WDT_OFFSET;
+
+	ret = sp5100_tco_prepare_base(tco, mmio_addr, alt_mmio_addr, dev_name);
+	if (!ret)
+		ret = sp5100_tco_timer_init(tco);
+
+	sp5100_release_region_mmio(tco);
+	return ret;
+}
+
 static int sp5100_tco_setupdevice(struct device *dev,
 				  struct watchdog_device *wdd)
 {
@@ -322,6 +421,9 @@ static int sp5100_tco_setupdevice(struct device *dev,
 	u32 alt_mmio_addr = 0;
 	int ret;
 
+	if (tco->tco_reg_layout == efch_mmio)
+		return sp5100_tco_setupdevice_mmio(dev, wdd);
+
 	/* Request the IO ports used by this driver */
 	if (!request_muxed_region(SP5100_IO_PM_INDEX_REG,
 				  SP5100_PM_IOPORTS_SIZE, "sp5100_tco")) {
diff --git a/drivers/watchdog/sp5100_tco.h b/drivers/watchdog/sp5100_tco.h
index adf015aa4126..73f179a1d6e5 100644
--- a/drivers/watchdog/sp5100_tco.h
+++ b/drivers/watchdog/sp5100_tco.h
@@ -83,3 +83,9 @@
 
 #define EFCH_PM_ACPI_MMIO_ADDR		0xfed80000
 #define EFCH_PM_ACPI_MMIO_WDT_OFFSET	0x00000b00
+#define EFCH_PM_ACPI_MMIO_PM_OFFSET	0x00000300
+
+#define EFCH_PM_ACPI_MMIO_PM_ADDR	(EFCH_PM_ACPI_MMIO_ADDR +	\
+					 EFCH_PM_ACPI_MMIO_PM_OFFSET)
+#define EFCH_PM_ACPI_MMIO_PM_SIZE       8
+
-- 
2.25.1

