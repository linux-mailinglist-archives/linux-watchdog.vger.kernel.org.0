Return-Path: <linux-watchdog+bounces-2814-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0013DA23F69
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 16:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2BB43A697E
	for <lists+linux-watchdog@lfdr.de>; Fri, 31 Jan 2025 15:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733F74502A;
	Fri, 31 Jan 2025 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="mVzQW07K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ElDoaEoQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D22A3D66;
	Fri, 31 Jan 2025 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738335905; cv=none; b=klFqQuKM8fvJx+AiUsO6UHyT6JtfcCzYAQJZ9WJO1EW/MwGYFO0PJm3S2sVdCSkGIuUiykPpG5RFrpffKTqHxInH7LEwSTYXVtj4P/7CiKk6WHa1zOEQfIdix149hiZIFDIOHIb9Rdk3lxDyRymN8hZkNptk63dAVtPhmlDgPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738335905; c=relaxed/simple;
	bh=Qzpd5lOdwagIa5yY9K1Vv8dFXngQH5Q1TcKdvpY4eZI=;
	h=MIME-Version:Date:From:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ONsD4OA20Q/Jf1PyAXICjfYi5CixZMzlthi+XIJJ1iqmI16t20RwVljJ7CIkSYFYXZJ/jGw/1mDw0wjbQRWVFFKvVckkKHb+Q5itiapMDI0boZj32XnxAtcNvEcFSyJYVbm8pN9fmw/M0KtaeTbdwiGar18Eaqy4ZeMZ9WLjEXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=mVzQW07K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ElDoaEoQ; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id E46791380208;
	Fri, 31 Jan 2025 10:05:00 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Fri, 31 Jan 2025 10:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to; s=fm1; t=1738335900; x=
	1738422300; bh=cdEA8Xv0ME8czifOWzoqTXbRdYVOvXtwpw5FfsfMBbY=; b=m
	VzQW07Kd7fEDpbVYnq2y6Zt1GKyUEgdbZ+YrwiSWQQq8Wts6jOm/YnOLGuU4YnN9
	ahko0S9kROka294qUVv8goG7JLBYjvBeJfFS+ojueBArJDmrDOL9bljPL+HEPX6U
	eGTAC+neZAn6o7PD3v5FyoCkvKSPxDpoPd0LC9BNemg/2FSan6NCzMw8OaTeDkEn
	+W8gAA6jbq57fsf0PnJ2aMFS1d9Kxu2hqsz4a5COVv2GiL6wm//wzMomOiqcB4xv
	acbF35nMcVWB5Aj14nxYx3iB9U4RlChAh3umwdcO/pqAlw3e1youzpKXNQRUGUKW
	H/ko8zZYTVAKMGA1EF2Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1738335900; x=1738422300; bh=c
	dEA8Xv0ME8czifOWzoqTXbRdYVOvXtwpw5FfsfMBbY=; b=ElDoaEoQwnw0dHOZy
	4IJH6g4JWbuUq3K1k+fC5MAX9utqdyCDiofAV5CBeNWI06BGOPek7X5vp3VKi01d
	4z7E8P0Px+e13KslDFeqkK9TbROgykf8O98AtOHj1M/HoYSGZyEhVpW++TCu7/gg
	usX/uFENPbstS2Vg57M4+CAIVSSjpKQ0bTMNkBRqD9cr3z5uXrObM/3SiLtVQtGN
	CDKdxFj8hdFl7TuqJ0HNWLHdjsgtIKJ7oJfc1/vzhCc78InnGJEo+TnJhgC2RNfJ
	E/iwrwYbXXG2X9klE+NzIt92dGMuNTMMDlbT8X3pznTLthGlkNGhCpv8EHMTrJiM
	39UvA==
X-ME-Sender: <xms:m-acZ8DmlBfbTDoFnKhoHg03Kvhe_pr1QbM9JezVor1mv4HUaxhlFw>
    <xme:m-acZ-jbrFKjsFQeugEEQd8JA2AvURfVz9F0G4xIEwxMXzKYnfn3FLPSbHcELWBpC
    9a9jPqWalQLvBU2cE4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnehmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnecujfgu
    rhepofggfffhvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcurf
    gvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeq
    necuggftrfgrthhtvghrnhepvdekfeeufedvvdefvedujeffuefgledvudeggeettedufe
    ehtdevjeffleetleeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspg
    hrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughosggvrhes
    lhgvnhhovhhordgtohhmpdhrtghpthhtohepfihimheslhhinhhugidqfigrthgthhguoh
    hgrdhorhhgpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:m-acZ_lpbGLrdjBAHxe_4N8OkHvvtKR7jjC_GHssa_N3FzlKNz63dw>
    <xmx:m-acZyxBzjNFnAcjf7cvvo3SbGj97p2MpN0FkI_MkEc6_NgEAm0BOg>
    <xmx:m-acZxQMM9ZGU-nWMbNfrOhlJpj5dPon9DBPGh0P7nsTCe1GrmrXwQ>
    <xmx:m-acZ9a47AvqgoN9ArmghZBK_Y5KXo3KIUqdJ9QbiATdO2GhEFsW0A>
    <xmx:nOacZ_MHVWsspQsdGyq33nO-3qw5tiIx72NEyiA30lQwVnV0HigDLFhB>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3FAD13C0068; Fri, 31 Jan 2025 10:04:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 10:04:38 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: "David Ober" <dober@lenovo.com>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <3ce31af2-df31-4782-94cb-a53b8ad52d5b@app.fastmail.com>
In-Reply-To: <20250116182912.1844-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20250116182912.1844-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30
 platform
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Thu, Jan 16, 2025, at 1:29 PM, Mark Pearson wrote:
> Watchdog driver implementation for Lenovo SE30 platform.
>
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v2:
>  - Removed acpi.h include as not needed
>  - Cleaned up define formatting as requested
>  - Rewrote timeout loop in shm_get_ready to use more sensible timeouts.
>  - Moved mem region request into probe. This created some opportunities
>    to simplify the lenovo_se30_wdt structure.
>
>  drivers/watchdog/Kconfig           |  12 +
>  drivers/watchdog/Makefile          |   1 +
>  drivers/watchdog/lenovo_se30_wdt.c | 401 +++++++++++++++++++++++++++++
>  3 files changed, 414 insertions(+)
>  create mode 100644 drivers/watchdog/lenovo_se30_wdt.c
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f81705f8539a..c73e8f0e436c 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -279,6 +279,18 @@ config LENOVO_SE10_WDT
>  	  This driver can also be built as a module. If so, the module
>  	  will be called lenovo-se10-wdt.
> 
> +config LENOVO_SE30_WDT
> +	tristate "Lenovo SE30 Watchdog"
> +	depends on (X86 && DMI) || COMPILE_TEST
> +	depends on HAS_IOPORT
> +	select WATCHDOG_CORE
> +	help
> +	  If you say yes here you get support for the watchdog
> +	  functionality for the Lenovo SE30 platform.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called lenovo-se30-wdt.
> +
>  config MENF21BMC_WATCHDOG
>  	tristate "MEN 14F021P00 BMC Watchdog"
>  	depends on MFD_MENF21BMC || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 8411626fa162..c9482904bf87 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -124,6 +124,7 @@ obj-$(CONFIG_I6300ESB_WDT) += i6300esb.o
>  obj-$(CONFIG_IE6XX_WDT) += ie6xx_wdt.o
>  obj-$(CONFIG_ITCO_WDT) += iTCO_wdt.o
>  obj-$(CONFIG_LENOVO_SE10_WDT) += lenovo_se10_wdt.o
> +obj-$(CONFIG_LENOVO_SE30_WDT) += lenovo_se30_wdt.o
>  ifeq ($(CONFIG_ITCO_VENDOR_SUPPORT),y)
>  obj-$(CONFIG_ITCO_WDT) += iTCO_vendor_support.o
>  endif
> diff --git a/drivers/watchdog/lenovo_se30_wdt.c 
> b/drivers/watchdog/lenovo_se30_wdt.c
> new file mode 100644
> index 000000000000..e17e0ab27b10
> --- /dev/null
> +++ b/drivers/watchdog/lenovo_se30_wdt.c
> @@ -0,0 +1,401 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * WDT driver for Lenovo SE30 device
> + */
> +
> +#define dev_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/dmi.h>
> +#include <linux/delay.h>
> +#include <linux/iommu.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/platform_device.h>
> +#include <linux/watchdog.h>
> +
> +#define IOREGION_OFFSET	4 /* Use EC port 1 */
> +#define IOREGION_LENGTH	4
> +
> +#define WATCHDOG_TIMEOUT	60
> +
> +#define MIN_TIMEOUT	1
> +#define MAX_TIMEOUT	255
> +#define MAX_WAIT	10
> +
> +static int timeout; /* in seconds */
> +module_param(timeout, int, 0);
> +MODULE_PARM_DESC(timeout,
> +		 "Watchdog timeout in seconds. 1 <= timeout <= 255, default="
> +		 __MODULE_STRING(WATCHDOG_TIMEOUT) ".");
> +
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout,
> +		 "Watchdog cannot be stopped once started (default="
> +		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
> +#define LNV_SE30_NAME	"lenovo-se30-wdt"
> +#define LNV_SE30_ID	0x0110
> +#define CHIPID_MASK	0xFFF0
> +
> +#define CHIPID_REG	0x20
> +#define SIO_REG		0x2e
> +#define LDN_REG		0x07
> +#define UNLOCK_KEY	0x87
> +#define LOCK_KEY	0xAA
> +#define LD_NUM_SHM	0x0F
> +#define LD_BASE_ADDR	0xF8
> +
> +#define WDT_MODULE	0x10
> +#define WDT_CFG_INDEX	0x15 /* WD configuration register */
> +#define WDT_CNT_INDEX	0x16 /* WD timer count register */
> +#define WDT_CFG_RESET	0x2
> +
> +/* Host Interface WIN2 offset definition */
> +#define SHM_WIN_SIZE		0xFF
> +#define SHM_WIN_MOD_OFFSET	0x01
> +#define SHM_WIN_CMD_OFFSET	0x02
> +#define SHM_WIN_SEL_OFFSET	0x03
> +#define SHM_WIN_CTL_OFFSET	0x04
> +#define VAL_SHM_WIN_CTRL_WR	0x40
> +#define VAL_SHM_WIN_CTRL_RD	0x80
> +#define SHM_WIN_ID_OFFSET	0x08
> +#define SHM_WIN_DAT_OFFSET	0x10
> +
> +struct nct6692_reg {
> +	unsigned char mod;
> +	unsigned char cmd;
> +	unsigned char sel;
> +	unsigned int idx;
> +};
> +
> +/* Watchdog is based on NCT6692 device */
> +struct lenovo_se30_wdt {
> +	unsigned char __iomem *shm_base_addr;
> +	struct nct6692_reg wdt_cfg;
> +	struct nct6692_reg wdt_cnt;
> +	struct watchdog_device wdt;
> +};
> +
> +static inline void superio_outb(int ioreg, int reg, int val)
> +{
> +	outb(reg, ioreg);
> +	outb(val, ioreg + 1);
> +}
> +
> +static inline int superio_inb(int ioreg, int reg)
> +{
> +	outb(reg, ioreg);
> +	return inb(ioreg + 1);
> +}
> +
> +static inline int superio_enter(int key, int addr, const char *name)
> +{
> +	if (!request_muxed_region(addr, 2, name)) {
> +		pr_err("I/O address 0x%04x already in use\n", addr);
> +		return -EBUSY;
> +	}
> +	outb(key, addr); /* Enter extended function mode */
> +	outb(key, addr); /* Again according to manual */
> +
> +	return 0;
> +}
> +
> +static inline void superio_exit(int key, int addr)
> +{
> +	outb(key, addr); /* Leave extended function mode */
> +	release_region(addr, 2);
> +}
> +
> +static int shm_get_ready(unsigned char __iomem *shm_base_addr,
> +			 const struct nct6692_reg *reg)
> +{
> +	unsigned char pre_id, new_id;
> +	int loop = 0;
> +
> +	iowrite8(reg->mod, shm_base_addr + SHM_WIN_MOD_OFFSET);
> +	iowrite8(reg->cmd, shm_base_addr + SHM_WIN_CMD_OFFSET);
> +	iowrite8(reg->sel, shm_base_addr + SHM_WIN_SEL_OFFSET);
> +
> +	pre_id = ioread8(shm_base_addr + SHM_WIN_ID_OFFSET);
> +	iowrite8(VAL_SHM_WIN_CTRL_RD, shm_base_addr + SHM_WIN_CTL_OFFSET);
> +
> +	/* Loop checking when interface is ready */
> +	while (loop < MAX_WAIT) {
> +		new_id = ioread8(shm_base_addr + SHM_WIN_ID_OFFSET);
> +		if (new_id != pre_id)
> +			return 0;
> +		loop++;
> +		usleep_range(10, 125);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int read_shm_win(unsigned char __iomem *shm_base_addr,
> +			const struct nct6692_reg *reg,
> +			unsigned char idx_offset,
> +			unsigned char *data)
> +{
> +	int err = shm_get_ready(shm_base_addr, reg);
> +
> +	if (err)
> +		return err;
> +	*data = ioread8(shm_base_addr + SHM_WIN_DAT_OFFSET + reg->idx + 
> idx_offset);
> +	return 0;
> +}
> +
> +static int write_shm_win(unsigned char __iomem *shm_base_addr,
> +			 const struct nct6692_reg *reg,
> +			 unsigned char idx_offset,
> +			 unsigned char val)
> +{
> +	int err = shm_get_ready(shm_base_addr, reg);
> +
> +	if (err)
> +		return err;
> +	iowrite8(val, shm_base_addr + SHM_WIN_DAT_OFFSET + reg->idx + 
> idx_offset);
> +	iowrite8(VAL_SHM_WIN_CTRL_WR, shm_base_addr + SHM_WIN_CTL_OFFSET);
> +	err = shm_get_ready(shm_base_addr, reg);
> +	return err;
> +}
> +
> +static int lenovo_se30_wdt_enable(struct lenovo_se30_wdt *data, 
> unsigned int timeout)
> +{
> +	if (timeout) {
> +		int err = write_shm_win(data->shm_base_addr, &data->wdt_cfg, 0, 
> WDT_CFG_RESET);
> +
> +		if (err)
> +			return err;
> +	}
> +	return write_shm_win(data->shm_base_addr, &data->wdt_cnt, 0, timeout);
> +}
> +
> +static int lenovo_se30_wdt_start(struct watchdog_device *wdog)
> +{
> +	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdog);
> +
> +	return lenovo_se30_wdt_enable(data, wdog->timeout);
> +}
> +
> +static int lenovo_se30_wdt_stop(struct watchdog_device *wdog)
> +{
> +	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdog);
> +
> +	return lenovo_se30_wdt_enable(data, 0);
> +}
> +
> +static int lenovo_se30_wdt_set_timeout(struct watchdog_device *wdog,
> +				       unsigned int timeout)
> +{
> +	wdog->timeout = timeout;
> +	return 0;
> +}
> +
> +static unsigned int lenovo_se30_wdt_get_timeleft(struct 
> watchdog_device *wdog)
> +{
> +	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdog);
> +	unsigned char timeleft;
> +	int err;
> +
> +	err = read_shm_win(data->shm_base_addr, &data->wdt_cnt, 0, &timeleft);
> +	if (err)
> +		return 0;
> +	return timeleft;
> +}
> +
> +static int lenovo_se30_wdt_ping(struct watchdog_device *wdt)
> +{
> +	struct lenovo_se30_wdt *data = watchdog_get_drvdata(wdt);
> +	int err = 0;
> +
> +	/*
> +	 * Device does not support refreshing WDT_TIMER_REG register when
> +	 * the watchdog is active.  Need to disable, feed and enable again
> +	 */
> +	err = lenovo_se30_wdt_enable(data, 0);
> +	if (err)
> +		return err;
> +
> +	err = write_shm_win(data->shm_base_addr, &data->wdt_cnt, 0, 
> wdt->timeout);
> +	if (!err)
> +		err = lenovo_se30_wdt_enable(data, wdt->timeout);
> +
> +	return err;
> +}
> +
> +static const struct watchdog_info lenovo_se30_wdt_info = {
> +	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
> +			  WDIOF_MAGICCLOSE,
> +	.identity	= "Lenovo SE30 watchdog",
> +};
> +
> +static const struct watchdog_ops lenovo_se30_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= lenovo_se30_wdt_start,
> +	.stop		= lenovo_se30_wdt_stop,
> +	.ping		= lenovo_se30_wdt_ping,
> +	.set_timeout	= lenovo_se30_wdt_set_timeout,
> +	.get_timeleft	= lenovo_se30_wdt_get_timeleft,
> +};
> +
> +static int lenovo_se30_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct lenovo_se30_wdt *priv;
> +	unsigned long base_phys;
> +	unsigned short val;
> +	int err;
> +
> +	err = superio_enter(UNLOCK_KEY, SIO_REG, LNV_SE30_NAME);
> +	if (err)
> +		return err;
> +
> +	val = superio_inb(SIO_REG, CHIPID_REG) << 8;
> +	val |= superio_inb(SIO_REG, CHIPID_REG + 1);
> +
> +	if ((val & CHIPID_MASK) != LNV_SE30_ID) {
> +		superio_exit(LOCK_KEY, SIO_REG);
> +		return -ENODEV;
> +	}
> +
> +	superio_outb(SIO_REG, LDN_REG, LD_NUM_SHM);
> +	base_phys = (superio_inb(SIO_REG, LD_BASE_ADDR) |
> +			 (superio_inb(SIO_REG, LD_BASE_ADDR + 1) << 8) |
> +			 (superio_inb(SIO_REG, LD_BASE_ADDR + 2) << 16) |
> +			 (superio_inb(SIO_REG, LD_BASE_ADDR + 3) << 24)) &
> +			0xFFFFFFFF;
> +
> +	superio_exit(LOCK_KEY, SIO_REG);
> +	if (base_phys == 0xFFFFFFFF || base_phys == 0)
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (!devm_request_mem_region(dev, base_phys, SHM_WIN_SIZE, 
> LNV_SE30_NAME))
> +		return -EBUSY;
> +
> +	priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
> +
> +	priv->wdt_cfg.mod = WDT_MODULE;
> +	priv->wdt_cfg.idx = WDT_CFG_INDEX;
> +	priv->wdt_cnt.mod = WDT_MODULE;
> +	priv->wdt_cnt.idx = WDT_CNT_INDEX;
> +
> +	priv->wdt.ops = &lenovo_se30_wdt_ops;
> +	priv->wdt.info = &lenovo_se30_wdt_info;
> +	priv->wdt.timeout = WATCHDOG_TIMEOUT; /* Set default timeout */
> +	priv->wdt.min_timeout = MIN_TIMEOUT;
> +	priv->wdt.max_timeout = MAX_TIMEOUT;
> +	priv->wdt.parent = dev;
> +
> +	watchdog_init_timeout(&priv->wdt, timeout, dev);
> +	watchdog_set_drvdata(&priv->wdt, priv);
> +	watchdog_set_nowayout(&priv->wdt, nowayout);
> +	watchdog_stop_on_reboot(&priv->wdt);
> +	watchdog_stop_on_unregister(&priv->wdt);
> +
> +	return devm_watchdog_register_device(dev, &priv->wdt);
> +}
> +
> +static struct platform_device *pdev;
> +
> +static struct platform_driver lenovo_se30_wdt_driver = {
> +	.driver = {
> +		.name = LNV_SE30_NAME,
> +	},
> +	.probe  = lenovo_se30_wdt_probe,
> +};
> +
> +static int lenovo_se30_create_platform_device(const struct 
> dmi_system_id *id)
> +{
> +	int err;
> +
> +	pdev = platform_device_alloc(LNV_SE30_NAME, -1);
> +	if (!pdev)
> +		return -ENOMEM;
> +
> +	err = platform_device_add(pdev);
> +	if (err)
> +		platform_device_put(pdev);
> +
> +	return err;
> +}
> +
> +static const struct dmi_system_id lenovo_se30_wdt_dmi_table[] 
> __initconst = {
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NA"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NB"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NC"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NH"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NJ"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{
> +		.ident = "LENOVO-SE30",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "11NK"),
> +		},
> +		.callback = lenovo_se30_create_platform_device,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(dmi, lenovo_se30_wdt_dmi_table);
> +
> +static int __init lenovo_se30_wdt_init(void)
> +{
> +	if (!dmi_check_system(lenovo_se30_wdt_dmi_table))
> +		return -ENODEV;
> +
> +	return platform_driver_register(&lenovo_se30_wdt_driver);
> +}
> +
> +static void __exit lenovo_se30_wdt_exit(void)
> +{
> +	if (pdev)
> +		platform_device_unregister(pdev);
> +	platform_driver_unregister(&lenovo_se30_wdt_driver);
> +}
> +
> +module_init(lenovo_se30_wdt_init);
> +module_exit(lenovo_se30_wdt_exit);
> +
> +MODULE_AUTHOR("Mark Pearson <mpearson-lenovo@squebb.ca>");
> +MODULE_AUTHOR("David Ober <dober@lenovo.com>");
> +MODULE_DESCRIPTION("Lenovo SE30 watchdog driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1

Wanted to see if there was any more feedback or concerns on this submission. Please let me know if I need to be making any further updates.

I did get the notes from the kernel test robot, but the issues raised were against the v1 patch and already addressed in v2 so I have ignored those.

Thanks
Mark

