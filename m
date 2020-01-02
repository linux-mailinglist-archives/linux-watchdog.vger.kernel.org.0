Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4139B12E5E3
	for <lists+linux-watchdog@lfdr.de>; Thu,  2 Jan 2020 12:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgABL4x (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 2 Jan 2020 06:56:53 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60029 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbgABL4w (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 2 Jan 2020 06:56:52 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1imz5p-0002XE-Hr; Thu, 02 Jan 2020 12:56:45 +0100
Message-ID: <9d98e6b7c82f3ed09a00d062fbcf6540b4c8d7e1.camel@pengutronix.de>
Subject: Re: [PATCH v7 2/2] watchdog: mtk_wdt: mt8183: Add reset controller
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>, yong.liang@mediatek.com,
        wim@linux-watchdog.org, linux@roeck-us.net, matthias.bgg@gmail.com,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com
Cc:     yingjoe.chen@mediatek.com, sboyd@kernel.org
Date:   Thu, 02 Jan 2020 12:56:45 +0100
In-Reply-To: <1577437494-738-3-git-send-email-jiaxin.yu@mediatek.com>
References: <1577437494-738-1-git-send-email-jiaxin.yu@mediatek.com>
         <1577437494-738-3-git-send-email-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 2019-12-27 at 17:04 +0800, Jiaxin Yu wrote:
> Add reset controller API in watchdog driver.
> Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---
>  drivers/watchdog/mtk_wdt.c | 105 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 104 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 9c3d0033260d..c1bc19ab628e 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
[...]
> @@ -155,6 +248,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
> +	struct mtk_wdt_data *wdt_data;
>  	int err;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> @@ -190,6 +284,13 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>  		 mtk_wdt->wdt_dev.timeout, nowayout);
>  
> +	wdt_data = (struct mtk_wdt_data *)of_device_get_match_data(dev);

The cast is not necessary, otherwise

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

