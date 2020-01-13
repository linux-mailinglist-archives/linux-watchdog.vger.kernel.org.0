Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43398138BC1
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2020 07:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733271AbgAMGUm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Jan 2020 01:20:42 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:43806 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731590AbgAMGUm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Jan 2020 01:20:42 -0500
Received: by mail-qk1-f195.google.com with SMTP id t129so7521098qke.10
        for <linux-watchdog@vger.kernel.org>; Sun, 12 Jan 2020 22:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbidIxb647dakpGFJlRyQ3/ihwOOmZc8NjZm9uAOe7Y=;
        b=WxS0Vug8xhyLR97I/t2SZL6RKMcPSykb1/Bq9crc1+OYZoBfukLaCJ9Tc9EkP/uu4X
         Z/um91CPIbStVhvRelpbdaq1iHMzd7+XSjtZ8VepD8xsTX0rMGUdOyTvMt7hl6oHtKMp
         1B6kNdZiMwE4Ii6DDhLJyCHRDlv0pDydLfxB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbidIxb647dakpGFJlRyQ3/ihwOOmZc8NjZm9uAOe7Y=;
        b=NE1v2gd45rZ8e1OhmSMxi34wBxH0UvC4wwm1dH5EcGnKZwB/G4KcceJG8hF1zZsaOH
         /QYeL9boD9h/vWSAIRPWB1HhvW/lsneuG2HiTHby7Yrel8JYqVfAdEJ8hSNL3/U6ZuDp
         92G5nfNXHjaJz9avfnXQ4BhzuRih15XCCMT3empy2rXfiA21xqhEcas6+2nVy4PYzKMf
         MegMvhW4iXAtKcA/D+C8j3yVraIVZqFHct2ax445T2e4NBTIMiDbmBlMFalZ21UVuTb8
         6aZo1ACX5ZazjSRhXNBYUZw3ngDKvKzZYEWnjJw8IYOj8sO+fIavjlbIYzk+C39e3Ss1
         evRQ==
X-Gm-Message-State: APjAAAWd8FJ8eShOU+v6DXjZkKRVFbHC6UEQnAZksWZ9HPRe887BiUGy
        2uG4SPm606ZSOoch8iiC7iQOwZ4R5IaYgp20+d79Xg==
X-Google-Smtp-Source: APXvYqyg+DfzeIRu42KEs7ygYGGHEH4ohvCGoNjEgPqdFrdCkhfaR1L7mh+JsDSUmfVNYFE5Ptt8z7b4B+RTP5IqduA=
X-Received: by 2002:a05:620a:6d7:: with SMTP id 23mr14062530qky.299.1578896440489;
 Sun, 12 Jan 2020 22:20:40 -0800 (PST)
MIME-Version: 1.0
References: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com> <1578639862-14480-4-git-send-email-jiaxin.yu@mediatek.com>
In-Reply-To: <1578639862-14480-4-git-send-email-jiaxin.yu@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 13 Jan 2020 14:20:29 +0800
Message-ID: <CANMq1KBxL55A8vDwNsqNpDmdNUxkpJ+JPByDaTEFwxnPQM8ESw@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] watchdog: mtk_wdt: mt2712: Add reset controller
To:     Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc:     Yong Liang <yong.liang@mediatek.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        chang-an.chen@mediatek.com, freddy.hsin@mediatek.com,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jan 10, 2020 at 3:04 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> Add reset controller for 2712.
> Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.
>
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

This is somewhat ok I guess, as Philipp review the same code before
you split it into 2 patches.

> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guenter Roeck <groeck7@gmail.com>

Those 2 need to be dropped.

> ---
>  drivers/watchdog/mtk_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index e88aacb0404d..d6a6393f609d 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,6 +9,7 @@
>   * Based on sunxi_wdt.c
>   */
>
> +#include <dt-bindings/reset-controller/mt2712-resets.h>
>  #include <dt-bindings/reset-controller/mt8183-resets.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -67,6 +68,10 @@ struct mtk_wdt_data {
>         int toprgu_sw_rst_num;
>  };
>
> +static const struct mtk_wdt_data mt2712_data = {
> +       .toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> +};
> +
>  static const struct mtk_wdt_data mt8183_data = {
>         .toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
>  };
> @@ -314,6 +319,7 @@ static int mtk_wdt_resume(struct device *dev)
>  #endif
>
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
> +       { .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>         { .compatible = "mediatek,mt6589-wdt" },
>         { .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>         { /* sentinel */ }
> --
> 2.18.0
