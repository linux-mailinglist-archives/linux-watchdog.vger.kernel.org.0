Return-Path: <linux-watchdog+bounces-2728-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F719A141B8
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 19:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B2C97A2C95
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 18:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86C222FAD3;
	Thu, 16 Jan 2025 18:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="rLVFNGZ2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GgWSHIEY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892CD22D4CF;
	Thu, 16 Jan 2025 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737052169; cv=none; b=ZtqdX7gKELtfoX97bussZzKu+BMQdkuHn36ACGD2s85ccOOXWMurUeLCDt0tG2ENC10SjWkPS2lKV8q8jyLDPrhoW4f1xHkYQk6aWLoPjQdUde70aG8c6sTqEuJjlFJ2+fKHC4nZrnZrBnuTMYCDSnNASKFkwKq0C6WZRrGxVF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737052169; c=relaxed/simple;
	bh=zhsE0CfuLYGSDRYAKBqD6p0WB2j5ZiaxURrH4WJwAlc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lf0yrQ1miwMCf72aL6kiMkt7mqMqQbXEzvh31G9hh5wc2v0tlwfl2DL9Rc+aw+I2RsD6cisB8nUF6AOZDNFU9/2v7QGoGjJ9OFy/h+mL1mqIeNkVLCQCy8J8g5HpP1kc0HQS3dY6sYqqqNYC+Zp2+CgCHEDlef05h/14D0AzqKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=rLVFNGZ2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GgWSHIEY; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 89BF111400FB;
	Thu, 16 Jan 2025 13:29:25 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 16 Jan 2025 13:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1737052165; x=
	1737138565; bh=qAha62wrJsxkLz5qpgOvKz8LSGLJUzNmzieA4BmNmnQ=; b=r
	LVFNGZ2j4rCkFkaOmlrBxSttEFs1WU1x1ZHL8qkOHjYIUZuyQRR+i/AQoRBUT6KC
	v3pvH0IW4zpcnifxpsLxabbhNW5A3oMp3kLyaUJRrdlykjEIZinqLbTYkIBEjmF1
	rM4LS0YB8SpeUicgoUKo3S9th7AEBhzL3xDPTNhNJZgSHOpwVbO04H96RxawgUHG
	qQdN0SbnUgYoATVrZb7Xar8VUSbmo+/1+rZ9d/NGvxN9tA4vqFWL9d+bf4K6fyd4
	fH+XBUH1bY1+YbI77aUsPcHGnqyQIGjR8KNezlRgSs0rg9s0uvzo9DCPDnPoLztc
	nn4m9GF2JsY5jrFjEmLGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1737052165; x=1737138565; bh=q
	Aha62wrJsxkLz5qpgOvKz8LSGLJUzNmzieA4BmNmnQ=; b=GgWSHIEYxIkatUNP8
	7F9rlJqMAiIM6r4X1S8LW3kwtymzPT0qEENlwxzd05Lybf5RzoH+jOXfnso9nqvx
	N5LfpoGXYPl4jsixyMipRNvagD+iFTuZlxTFgKRhC6pFS9ZF5rq7g5ubrErwNDko
	vlifViSb2Twu6A9Gesmo+KFkOiawpJXDs1rkeJfu7c8kYd746S1/Bc8+MJ/ppbIb
	JFmzUzEokbroBWRM1sH1RD1WtEXJI4tGzxnxbk6QqJthESPQrC+R/ZY7aZHgF1y4
	zjjUWPFNcl/lsFlkOVx4aPRkpCCJUQuwCy3cIBzbZzgAPw3nP47LWi3n22lXYic5
	jojAw==
X-ME-Sender: <xms:BFCJZ4Rfd-_3lp8AVIgqoNDU3q9Bcnw_GLCBx9Sv2ubN_dIqxhoaDA>
    <xme:BFCJZ1xfSgNjHpJVbi59uutx8EXtCC7LAr6v6dkG8h8yE_0ZtLp9P4r4CWCqdOUow
    Ir9xOtsvdiCbIU9zgw>
X-ME-Received: <xmr:BFCJZ12ah-DSl5Vh47nPrsqKp4oGUup5LKmtrFjEdoAVoP20f3fn_UIZe-aoI6Gbz-YqvRsKUEe-IEZ0Umsl4LzgHJE9NZU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecuogetfedtuddqtdduuc
    dludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhm
    peforghrkhcurfgvrghrshhonhcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvg
    gssgdrtggrqeenucggtffrrghtthgvrhhnpeeftddvjeefleffvefhgfejjeehudetteei
    geeugfekhffhgeejudeuteehgfdvffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdr
    tggrpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhrtghpthhtohepugho
    sggvrheslhgvnhhovhhordgtohhmpdhrtghpthhtohepfihimheslhhinhhugidqfigrth
    gthhguohhgrdhorhhgpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvght
    pdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:BFCJZ8CzC6f2SCMXceKTe73fRAXu19xMCXp4c2N7tOtwAkE6Di7ECA>
    <xmx:BFCJZxjNvRRL-KLbvS_5GQvdXSYZjXK3LpCAqkjsIYU5YiGS1ygOYA>
    <xmx:BFCJZ4p_Gr7ttg7lrALt0Z9lkb5wGQ1z7hOT4oyi9XOcqhhcZzABYw>
    <xmx:BFCJZ0jbs3HtSPSZkAspUVttyJPiKsm1dvXx4za9yAkqpWmb6KbJnQ>
    <xmx:BVCJZ8WtSy8VUgVq1O4jbnMzGB0rR-jsEncOZmPIV0U-RazbFQ2TU_0X>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jan 2025 13:29:24 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: dober@lenovo.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30 platform
Date: Thu, 16 Jan 2025 13:29:12 -0500
Message-Id: <20250116182912.1844-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Watchdog driver implementation for Lenovo SE30 platform.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2:
 - Removed acpi.h include as not needed
 - Cleaned up define formatting as requested
 - Rewrote timeout loop in shm_get_ready to use more sensible timeouts.
 - Moved mem region request into probe. This created some opportunities
   to simplify the lenovo_se30_wdt structure.

 drivers/watchdog/Kconfig           |  12 +
 drivers/watchdog/Makefile          |   1 +
 drivers/watchdog/lenovo_se30_wdt.c | 401 +++++++++++++++++++++++++++++
 3 files changed, 414 insertions(+)
 create mode 100644 drivers/watchdog/lenovo_se30_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f81705f8539a..c73e8f0e436c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -279,6 +279,18 @@ config LENOVO_SE10_WDT
 	  This driver can also be built as a module. If so, the module
 	  will be called lenovo-se10-wdt.
 
+config LENOVO_SE30_WDT
+	tristate "Lenovo SE30 Watchdog"
+	depends on (X86 && DMI) || COMPILE_TEST
+	depends on HAS_IOPORT
+	select WATCHDOG_CORE
+	help
+	  If you say yes here you get support for the watchdog
+	  functionality for the Lenovo SE30 platform.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called lenovo-se30-wdt.
+
 config MENF21BMC_WATCHDOG
 	tristate "MEN 14F021P00 BMC Watchdog"
 	depends on MFD_MENF21BMC || COMPILE_TEST
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 8411626fa162..c9482904bf87 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -124,6 +124,7 @@ obj-$(CONFIG_I6300ESB_WDT) += i6300esb.o
 obj-$(CONFIG_IE6XX_WDT) += ie6xx_wdt.o
 obj-$(CONFIG_ITCO_WDT) += iTCO_wdt.o
 obj-$(CONFIG_LENOVO_SE10_WDT) += lenovo_se10_wdt.o
+obj-$(CONFIG_LENOVO_SE30_WDT) += lenovo_se30_wdt.o
 ifeq ($(CONFIG_ITCO_VENDOR_SUPPORT),y)
 obj-$(CONFIG_ITCO_WDT) += iTCO_vendor_support.o
 endif
diff --git a/drivers/watchdog/lenovo_se30_wdt.c b/drivers/watchdog/lenovo_se30_wdt.c
new file mode 100644
index 000000000000..e17e0ab27b10
--- /dev/null
+++ b/drivers/watchdog/lenovo_se30_wdt.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * WDT driver for Lenovo SE30 device
+ */
+
+#define dev_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/dmi.h>
+#include <linux/delay.h>
+#include <linux/iommu.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/watchdog.h>
+
+#define IOREGION_OFFSET	4 /* Use EC port 1 */
+#define IOREGION_LENGTH	4
+
+#define WATCHDOG_TIMEOUT	60
+
+#define MIN_TIMEOUT	1
+#define MAX_TIMEOUT	255
+#define MAX_WAIT	10
+
+static int timeout; /* in seconds */
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout,
+		 "Watchdog timeout in seconds. 1 <= timeout <= 255, default="
+		 __MODULE_STRING(WATCHDOG_TIMEOUT) ".");
+
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		 "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+#define LNV_SE30_NAME	"lenovo-se30-wdt"
+#define LNV_SE30_ID	0x0110
+#define CHIPID_MASK	0xFFF0
+
+#define CHIPID_REG	0x20
+#define SIO_REG		0x2e
+#define LDN_REG		0x07
+#define UNLOCK_KEY	0x87
+#define LOCK_KEY	0xAA
+#define LD_NUM_SHM	0x0F
+#define LD_BASE_ADDR	0xF8
+
+#define WDT_MODULE	0x10
+#define WDT_CFG_INDEX	0x15 /* WD configuration register */
+#define WDT_CNT_INDEX	0x16 /* WD timer count register */
+#define WDT_CFG_RESET	0x2
+
+/* Host Interface WIN2 offset definition */
+#define SHM_WIN_SIZE		0xFF
+#define SHM_WIN_MOD_OFFSET	0x01
+#define SHM_WIN_CMD_OFFSET	0x02
+#define SHM_WIN_SEL_OFFSET	0x03
+#define SHM_WIN_CTL_OFFSET	0x04
+#define VAL_SHM_WIN_CTRL_WR	0x40
+#define VAL_SHM_WIN_CTRL_RD	0x80
+#define SHM_WIN_ID_OFFSET	0x08
+#define SHM_WIN_DAT_OFFSET	0x10
+
+struct nct6692_reg {
+	unsigned char mod;
+	unsigned char cmd;
+	unsigned char sel;
+	unsigned int idx;
+};
+
+/* Watchdog is based on NCT6692 device */
+struct lenovo_se30_wdt {
+	unsigned char __iomem *shm_base_addr;
+	struct nct6692_reg wdt_cfg;
+	struct nct6692_reg wdt_cnt;
+	struct watchdog_device wdt;
+};
+
+static inline void superio_outb(int ioreg, int reg, int val)
+{
+	outb(reg, ioreg);
+	outb(val, ioreg + 1);
+}
+
+static inline int superio_inb(int ioreg, int reg)
+{
+	outb(reg, ioreg);
+	return inb(ioreg + 1);
+}
+
+static inline int superio_enter(int key, int addr, const char *name)
+{
+	if (!request_muxed_region(addr, 2, name)) {
+		pr_err("I/O address 0x%04x already in use\n", addr);
+		return -EBUSY;
+	}
+	outb(key, addr); /* Enter extended function mode */
+	outb(key, addr); /* Again according to manual */
+
+	return 0;
+}
+
+static inline void superio_exit(int key, int addr)
+{
+	outb(key, addr); /* Leave extended function mode */
+	release_region(addr, 2);
+}
+
+static int shm_get_ready(unsigned char __iomem *shm_base_addr,
+			 const struct nct6692_reg *reg)
+{
+	unsigned char pre_id, new_id;
+	int loop = 0;
+
+	iowrite8(reg->mod, shm_base_addr + SHM_WIN_MOD_OFFSET);
+	iowrite8(reg->cmd, shm_base_addr + SHM_WIN_CMD_OFFSET);
+	iowrite8(reg->sel, shm_base_addr + SHM_WIN_SEL_OFFSET);
+
+	pre_id = ioread8(shm_base_addr + SHM_WIN_ID_OFFSET);
+	iowrite8(VAL_SHM_WIN_CTRL_RD, shm_base_addr + SHM_WIN_CTL_OFFSET);
+
+	/* Loop checking when interface is ready */
+	while (loop < MAX_WAIT) {
+		new_id = ioread8(shm_base_addr + SHM_WIN_ID_OFFSET);
+		if (new_id != pre_id)
+			return 0;
+		loop++;
+		usleep_range(10, 125);
+	}
+	return -ETIMEDOUT;
+}
+
+static int read_shm_win(unsigned char __iomem *shm_base_addr,
+			const struct nct6692_reg *reg,
+			unsigned char idx_offset,
+			unsigned char *data)
+{
+	int err = shm_get_ready(shm_base_addr, reg);
+
+	if (err)
+		return err;
+	*data = ioread8(shm_base_addr + SHM_WIN_DAT_OFFSET + reg->idx + idx_offset);
+	return 0;
+}
+
+static int write_shm_win(unsigned char __iomem *shm_base_addr,
+			 const struct nct6692_reg *reg,
+			 unsigned char idx_offset,
+			 unsigned char val)
+{
+	int err = shm_get_ready(shm_base_addr, reg);
+
+	if (err)
+		return err;
+	iowrite8(val, shm_base_addr + SHM_WIN_DAT_OFFSET + reg->idx + idx_offset);
+	iowrite8(VAL_SHM_WIN_CTRL_WR, shm_base_addr + SHM_WIN_CTL_OFFSET);
+	err = shm_get_ready(shm_base_addr, reg);
+	return err;
+}
+
+static int lenovo_se30_wdt_enable(struct lenovo_se30_wdt *data, unsigned int timeout)
+{
+	if (timeout) {
+		int err = write_shm_win(data->shm_base_addr, &data->wdt_cfg, 0, WDT_CFG_RESET);
+
+		if (err)
+			return err;
+	}
+	return write_shm_win(data->shm_base_addr, &data->wdt_cnt, 0, timeout);
+}
+
+static int lenovo_se30_wdt_start(struct watchdog_device *wdog)
+{
+	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdog);
+
+	return lenovo_se30_wdt_enable(data, wdog->timeout);
+}
+
+static int lenovo_se30_wdt_stop(struct watchdog_device *wdog)
+{
+	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdog);
+
+	return lenovo_se30_wdt_enable(data, 0);
+}
+
+static int lenovo_se30_wdt_set_timeout(struct watchdog_device *wdog,
+				       unsigned int timeout)
+{
+	wdog->timeout = timeout;
+	return 0;
+}
+
+static unsigned int lenovo_se30_wdt_get_timeleft(struct watchdog_device *wdog)
+{
+	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdog);
+	unsigned char timeleft;
+	int err;
+
+	err = read_shm_win(data->shm_base_addr, &data->wdt_cnt, 0, &timeleft);
+	if (err)
+		return 0;
+	return timeleft;
+}
+
+static int lenovo_se30_wdt_ping(struct watchdog_device *wdt)
+{
+	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdt);
+	int err = 0;
+
+	/*
+	 * Device does not support refreshing WDT_TIMER_REG register when
+	 * the watchdog is active.  Need to disable, feed and enable again
+	 */
+	err = lenovo_se30_wdt_enable(data, 0);
+	if (err)
+		return err;
+
+	err = write_shm_win(data->shm_base_addr, &data->wdt_cnt, 0, wdt->timeout);
+	if (!err)
+		err = lenovo_se30_wdt_enable(data, wdt->timeout);
+
+	return err;
+}
+
+static const struct watchdog_info lenovo_se30_wdt_info = {
+	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
+			  WDIOF_MAGICCLOSE,
+	.identity	= "Lenovo SE30 watchdog",
+};
+
+static const struct watchdog_ops lenovo_se30_wdt_ops = {
+	.owner		= THIS_MODULE,
+	.start		= lenovo_se30_wdt_start,
+	.stop		= lenovo_se30_wdt_stop,
+	.ping		= lenovo_se30_wdt_ping,
+	.set_timeout	= lenovo_se30_wdt_set_timeout,
+	.get_timeleft	= lenovo_se30_wdt_get_timeleft,
+};
+
+static int lenovo_se30_wdt_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lenovo_se30_wdt *priv;
+	unsigned long base_phys;
+	unsigned short val;
+	int err;
+
+	err = superio_enter(UNLOCK_KEY, SIO_REG, LNV_SE30_NAME);
+	if (err)
+		return err;
+
+	val = superio_inb(SIO_REG, CHIPID_REG) << 8;
+	val |= superio_inb(SIO_REG, CHIPID_REG + 1);
+
+	if ((val & CHIPID_MASK) != LNV_SE30_ID) {
+		superio_exit(LOCK_KEY, SIO_REG);
+		return -ENODEV;
+	}
+
+	superio_outb(SIO_REG, LDN_REG, LD_NUM_SHM);
+	base_phys = (superio_inb(SIO_REG, LD_BASE_ADDR) |
+			 (superio_inb(SIO_REG, LD_BASE_ADDR + 1) << 8) |
+			 (superio_inb(SIO_REG, LD_BASE_ADDR + 2) << 16) |
+			 (superio_inb(SIO_REG, LD_BASE_ADDR + 3) << 24)) &
+			0xFFFFFFFF;
+
+	superio_exit(LOCK_KEY, SIO_REG);
+	if (base_phys == 0xFFFFFFFF || base_phys == 0)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (!devm_request_mem_region(dev, base_phys, SHM_WIN_SIZE, LNV_SE30_NAME))
+		return -EBUSY;
+
+	priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
+
+	priv->wdt_cfg.mod = WDT_MODULE;
+	priv->wdt_cfg.idx = WDT_CFG_INDEX;
+	priv->wdt_cnt.mod = WDT_MODULE;
+	priv->wdt_cnt.idx = WDT_CNT_INDEX;
+
+	priv->wdt.ops = &lenovo_se30_wdt_ops;
+	priv->wdt.info = &lenovo_se30_wdt_info;
+	priv->wdt.timeout = WATCHDOG_TIMEOUT; /* Set default timeout */
+	priv->wdt.min_timeout = MIN_TIMEOUT;
+	priv->wdt.max_timeout = MAX_TIMEOUT;
+	priv->wdt.parent = dev;
+
+	watchdog_init_timeout(&priv->wdt, timeout, dev);
+	watchdog_set_drvdata(&priv->wdt, priv);
+	watchdog_set_nowayout(&priv->wdt, nowayout);
+	watchdog_stop_on_reboot(&priv->wdt);
+	watchdog_stop_on_unregister(&priv->wdt);
+
+	return devm_watchdog_register_device(dev, &priv->wdt);
+}
+
+static struct platform_device *pdev;
+
+static struct platform_driver lenovo_se30_wdt_driver = {
+	.driver = {
+		.name = LNV_SE30_NAME,
+	},
+	.probe  = lenovo_se30_wdt_probe,
+};
+
+static int lenovo_se30_create_platform_device(const struct dmi_system_id *id)
+{
+	int err;
+
+	pdev = platform_device_alloc(LNV_SE30_NAME, -1);
+	if (!pdev)
+		return -ENOMEM;
+
+	err = platform_device_add(pdev);
+	if (err)
+		platform_device_put(pdev);
+
+	return err;
+}
+
+static const struct dmi_system_id lenovo_se30_wdt_dmi_table[] __initconst = {
+	{
+		.ident = "LENOVO-SE30",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "11NA"),
+		},
+		.callback = lenovo_se30_create_platform_device,
+	},
+	{
+		.ident = "LENOVO-SE30",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "11NB"),
+		},
+		.callback = lenovo_se30_create_platform_device,
+	},
+	{
+		.ident = "LENOVO-SE30",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "11NC"),
+		},
+		.callback = lenovo_se30_create_platform_device,
+	},
+	{
+		.ident = "LENOVO-SE30",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "11NH"),
+		},
+		.callback = lenovo_se30_create_platform_device,
+	},
+	{
+		.ident = "LENOVO-SE30",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "11NJ"),
+		},
+		.callback = lenovo_se30_create_platform_device,
+	},
+	{
+		.ident = "LENOVO-SE30",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "11NK"),
+		},
+		.callback = lenovo_se30_create_platform_device,
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(dmi, lenovo_se30_wdt_dmi_table);
+
+static int __init lenovo_se30_wdt_init(void)
+{
+	if (!dmi_check_system(lenovo_se30_wdt_dmi_table))
+		return -ENODEV;
+
+	return platform_driver_register(&lenovo_se30_wdt_driver);
+}
+
+static void __exit lenovo_se30_wdt_exit(void)
+{
+	if (pdev)
+		platform_device_unregister(pdev);
+	platform_driver_unregister(&lenovo_se30_wdt_driver);
+}
+
+module_init(lenovo_se30_wdt_init);
+module_exit(lenovo_se30_wdt_exit);
+
+MODULE_AUTHOR("Mark Pearson <mpearson-lenovo@squebb.ca>");
+MODULE_AUTHOR("David Ober <dober@lenovo.com>");
+MODULE_DESCRIPTION("Lenovo SE30 watchdog driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


