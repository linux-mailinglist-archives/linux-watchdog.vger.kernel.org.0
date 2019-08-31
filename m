Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A05C0A44B7
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Aug 2019 16:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbfHaOYG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 31 Aug 2019 10:24:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:20471 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728048AbfHaOYF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 31 Aug 2019 10:24:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Aug 2019 07:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,451,1559545200"; 
   d="scan'208";a="181484648"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2019 07:24:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7773D210; Sat, 31 Aug 2019 17:24:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: i801: Use iTCO version 6 in Cannon Lake PCH and beyond
Date:   Sat, 31 Aug 2019 17:24:02 +0300
Message-Id: <20190831142402.49736-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190831142402.49736-1-mika.westerberg@linux.intel.com>
References: <20190831142402.49736-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Intel Cannon Lake PCH moved the NO_REBOOT bit to reside as part of the
TCO registers instead so update the i2c-i801 driver so that for Cannon
Lake and beyond register platform device for iTCO using version 6. The
affected PCHs are Cannon Lake, Cedar Fork, Comet Lake, Elkhart Lake and
Ice Lake.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/i2c/busses/i2c-i801.c | 142 +++++++++++++++++++++-------------
 1 file changed, 88 insertions(+), 54 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index f2956936c3f2..ebb3f7f17b95 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -292,7 +292,8 @@ struct i801_priv {
 #define FEATURE_HOST_NOTIFY	BIT(5)
 /* Not really a feature, but it's convenient to handle it as such */
 #define FEATURE_IDF		BIT(15)
-#define FEATURE_TCO		BIT(16)
+#define FEATURE_TCO_SPT		BIT(16)
+#define FEATURE_TCO_CNL		BIT(17)
 
 static const char *i801_feature_names[] = {
 	"SMBus PEC",
@@ -1491,57 +1492,23 @@ static inline unsigned int i801_get_adapter_class(struct i801_priv *priv)
 }
 #endif
 
-static const struct itco_wdt_platform_data tco_platform_data = {
+static const struct itco_wdt_platform_data spt_tco_platform_data = {
 	.name = "Intel PCH",
 	.version = 4,
 };
 
 static DEFINE_SPINLOCK(p2sb_spinlock);
 
-static void i801_add_tco(struct i801_priv *priv)
+static struct platform_device *
+i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
+		 struct resource *tco_res)
 {
-	struct pci_dev *pci_dev = priv->pci_dev;
-	struct resource tco_res[3], *res;
-	struct platform_device *pdev;
+	struct resource *res;
 	unsigned int devfn;
-	u32 tco_base, tco_ctl;
-	u32 base_addr, ctrl_val;
 	u64 base64_addr;
+	u32 base_addr;
 	u8 hidden;
 
-	if (!(priv->features & FEATURE_TCO))
-		return;
-
-	pci_read_config_dword(pci_dev, TCOBASE, &tco_base);
-	pci_read_config_dword(pci_dev, TCOCTL, &tco_ctl);
-	if (!(tco_ctl & TCOCTL_EN))
-		return;
-
-	memset(tco_res, 0, sizeof(tco_res));
-
-	res = &tco_res[ICH_RES_IO_TCO];
-	res->start = tco_base & ~1;
-	res->end = res->start + 32 - 1;
-	res->flags = IORESOURCE_IO;
-
-	/*
-	 * Power Management registers.
-	 */
-	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
-	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
-
-	res = &tco_res[ICH_RES_IO_SMI];
-	res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
-	res->end = res->start + 3;
-	res->flags = IORESOURCE_IO;
-
-	/*
-	 * Enable the ACPI I/O space.
-	 */
-	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPICTRL, &ctrl_val);
-	ctrl_val |= ACPICTRL_EN;
-	pci_bus_write_config_dword(pci_dev->bus, devfn, ACPICTRL, ctrl_val);
-
 	/*
 	 * We must access the NO_REBOOT bit over the Primary to Sideband
 	 * bridge (P2SB). The BIOS prevents the P2SB device from being
@@ -1577,15 +1544,76 @@ static void i801_add_tco(struct i801_priv *priv)
 	res->end = res->start + 3;
 	res->flags = IORESOURCE_MEM;
 
-	pdev = platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
-						 tco_res, 3, &tco_platform_data,
-						 sizeof(tco_platform_data));
-	if (IS_ERR(pdev)) {
-		dev_warn(&pci_dev->dev, "failed to create iTCO device\n");
+	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
+					tco_res, 3, &spt_tco_platform_data,
+					sizeof(spt_tco_platform_data));
+}
+
+static const struct itco_wdt_platform_data cnl_tco_platform_data = {
+	.name = "Intel PCH",
+	.version = 6,
+};
+
+static struct platform_device *
+i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
+		 struct resource *tco_res)
+{
+	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
+					tco_res, 2, &cnl_tco_platform_data,
+					sizeof(cnl_tco_platform_data));
+}
+
+static void i801_add_tco(struct i801_priv *priv)
+{
+	u32 base_addr, tco_base, tco_ctl, ctrl_val;
+	struct pci_dev *pci_dev = priv->pci_dev;
+	struct resource tco_res[3], *res;
+	unsigned int devfn;
+
+	/* If we have ACPI based watchdog use that instead */
+	if (acpi_has_watchdog())
+		return;
+
+	if (!(priv->features & (FEATURE_TCO_SPT | FEATURE_TCO_CNL)))
 		return;
-	}
 
-	priv->tco_pdev = pdev;
+	pci_read_config_dword(pci_dev, TCOBASE, &tco_base);
+	pci_read_config_dword(pci_dev, TCOCTL, &tco_ctl);
+	if (!(tco_ctl & TCOCTL_EN))
+		return;
+
+	memset(tco_res, 0, sizeof(tco_res));
+
+	res = &tco_res[ICH_RES_IO_TCO];
+	res->start = tco_base & ~1;
+	res->end = res->start + 32 - 1;
+	res->flags = IORESOURCE_IO;
+
+	/*
+	 * Power Management registers.
+	 */
+	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
+	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
+
+	res = &tco_res[ICH_RES_IO_SMI];
+	res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
+	res->end = res->start + 3;
+	res->flags = IORESOURCE_IO;
+
+	/*
+	 * Enable the ACPI I/O space.
+	 */
+	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPICTRL, &ctrl_val);
+	ctrl_val |= ACPICTRL_EN;
+	pci_bus_write_config_dword(pci_dev->bus, devfn, ACPICTRL, ctrl_val);
+
+	if (priv->features & FEATURE_TCO_CNL)
+		priv->tco_pdev = i801_add_tco_cnl(priv, pci_dev, tco_res);
+	else
+		priv->tco_pdev = i801_add_tco_spt(priv, pci_dev, tco_res);
+
+	if (IS_ERR(priv->tco_pdev))
+		dev_warn(&pci_dev->dev, "failed to create iTCO device\n");
 }
 
 #ifdef CONFIG_ACPI
@@ -1695,13 +1723,21 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	switch (dev->device) {
 	case PCI_DEVICE_ID_INTEL_SUNRISEPOINT_H_SMBUS:
 	case PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_SMBUS:
-	case PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS:
-	case PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS:
 	case PCI_DEVICE_ID_INTEL_LEWISBURG_SMBUS:
 	case PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS:
-	case PCI_DEVICE_ID_INTEL_CDF_SMBUS:
 	case PCI_DEVICE_ID_INTEL_DNV_SMBUS:
 	case PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS:
+		priv->features |= FEATURE_I2C_BLOCK_READ;
+		priv->features |= FEATURE_IRQ;
+		priv->features |= FEATURE_SMBUS_PEC;
+		priv->features |= FEATURE_BLOCK_BUFFER;
+		priv->features |= FEATURE_TCO_SPT;
+		priv->features |= FEATURE_HOST_NOTIFY;
+		break;
+
+	case PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS:
+	case PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS:
+	case PCI_DEVICE_ID_INTEL_CDF_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS:
 	case PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
@@ -1711,9 +1747,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		priv->features |= FEATURE_IRQ;
 		priv->features |= FEATURE_SMBUS_PEC;
 		priv->features |= FEATURE_BLOCK_BUFFER;
-		/* If we have ACPI based watchdog use that instead */
-		if (!acpi_has_watchdog())
-			priv->features |= FEATURE_TCO;
+		priv->features |= FEATURE_TCO_CNL;
 		priv->features |= FEATURE_HOST_NOTIFY;
 		break;
 
-- 
2.23.0.rc1

