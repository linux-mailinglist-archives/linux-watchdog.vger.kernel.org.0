Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 984AFAA6FC
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 17:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732541AbfIEPIo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 11:08:44 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45699 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732147AbfIEPIo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 11:08:44 -0400
Received: by mail-pf1-f194.google.com with SMTP id y72so1919254pfb.12;
        Thu, 05 Sep 2019 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LB6xSBfuSinZAMV9aZFPQIN9CvwHLjeqldm8lg5+A+Y=;
        b=sAZJDoPXIbsX6QlILVophZ3Bq/anEIraDsVmTx3AukE6/pGhp7fYUtWiiU1kS1OP8p
         dEBvDbtNfKtJAfS5JP3HGcfdtHwxW2Y3AY9IUf6NF63ZbOv3Upl2bOH0PnKgHGVr0STS
         7+G1WP6DcE9RJ50xVxTNrS7P0ILJUWTpPJ8i9qpIIfo+DuCNp/Ecy7CMjsOXm3jwoiG8
         JW5PP90uSM5hGN1uLoq/9IN6VEHV2eI2d26qGMBQtLZS4mWfC4fQuO+AVObMdgD867qc
         YzOh+ch+V65CcQbzeHMe7wfDHQnm3niS9XxozCdKS2ehwyp7oFy+jvy5NrS4bEs/zzel
         3mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=LB6xSBfuSinZAMV9aZFPQIN9CvwHLjeqldm8lg5+A+Y=;
        b=uY16QGJMLPdG3KwbxJgU5UbALdENiyM5DDJeP1oC1KJR1NAMudTe0dkRs+xC64ykN0
         nG3yoVZyus0Kn4YRChn4fyHJZBMisXUOqhnilGqoAtgJgzgaivhrh9GDTOSKYoxetyzZ
         GPcgoFjwT+okxSUfK2ZqPpMXwA0ToiP7VyYpaxPJr9nUV/ExAYHhnIPzkrBDkj2weTnL
         yqPacn+halAYJyziYzCvgTzGz/pyPM8jKRWpWpQqgw97ZFtMnPc9Es9PGpA1tz0hAAHh
         y5V9mdg1J0/4DXoxhQlecm+zCkm7DIDcrORxbyKyya+h+BSOcnm3gyMqRH8fjU8CkqFr
         fiCA==
X-Gm-Message-State: APjAAAUdEUAJwPLWIblImHSpIHyQsoJA9qKPqQC6gs8CactPY2cOb5nd
        jXvRG/f4QwuVNoge1dtjeS8=
X-Google-Smtp-Source: APXvYqzqkGvx3UcZXiDT5spOETXK6s5o3oXyFaN70PjXaqGaH2s7389q6JxbkaQZHonn8smeEqxCvw==
X-Received: by 2002:a63:3281:: with SMTP id y123mr3510207pgy.72.1567696123943;
        Thu, 05 Sep 2019 08:08:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f62sm3746676pfg.74.2019.09.05.08.08.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 08:08:43 -0700 (PDT)
Date:   Thu, 5 Sep 2019 08:08:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Oliver Graute <oliver.graute@kococonnector.com>
Cc:     "oliver.graute@gmail.com" <oliver.graute@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH v2] watchdog: imx_sc: this patch just fixes whitespaces
Message-ID: <20190905150842.GB18080@roeck-us.net>
References: <20190905143644.20952-1-oliver.graute@kococonnector.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905143644.20952-1-oliver.graute@kococonnector.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Sep 05, 2019 at 02:36:49PM +0000, Oliver Graute wrote:
> Fix only whitespace errors in imx_sc_wdt_probe()
> 
> Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>

Ah, there are indeed extra spaces in these lines.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx_sc_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index 9260475439eb..7ea5cf54e94a 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -176,8 +176,8 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>  
>  	ret = devm_watchdog_register_device(dev, wdog);
>  	if (ret)
> - 		return ret;
> - 
> +		return ret;
> +
>  	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
>  				       SC_IRQ_WDOG,
>  				       true);
> -- 
> 2.17.1
> 
