Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8A8BAA453
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Sep 2019 15:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731214AbfIENY1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Sep 2019 09:24:27 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36559 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730867AbfIENY0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Sep 2019 09:24:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id y22so1763343pfr.3;
        Thu, 05 Sep 2019 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NwpAVuykxjo28VFm7bl/dVDMbsAXCwnrZvHXpATq9OE=;
        b=T1vY/qS1bDi1uE03rHJZQcoDpjn1iYskFjqL+aQxBZeWtakrknmqQOc+9wmI2fQVNf
         H0LVRd2s/IKVyXeYtP3EpHj5zjD8WIIbJRa83+EyY9rKrEUoepgoLH+ErA5V+Itt4WWr
         4IgoORSsJHgK5K4Fe8+J8n5hr6WBKDa2eoDFNBLAQ2n/uz1z63Xrbi/zpfASfBpMhokf
         FXFjMeG/Mrs54fFEO+rYUP/hZAs3lIamTiVRJAqOllbvgami7nl+eRvEBOfBqNLhTinb
         pc/wyEnw6b1aLJ3C//iJDiQji+KvsIc0h2ixioahZNYqImO6ErQQUDOU8JvONiYDMusd
         0omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NwpAVuykxjo28VFm7bl/dVDMbsAXCwnrZvHXpATq9OE=;
        b=ZBCG0X9G3UU6om5UGj0iBcUHq7raqUKNd26GMaSFz/sm4Bxp6glWSz+wPjxwIRSdNV
         Cu8ZG9GVOyHqwaO6p1UlK9a8DtWfVreOoOs353hdKO8YU9Pua+Rm26+uTvM+f5fxXDKq
         e39qpgJ/IGnn5dR/WXhj4G4oS7v7GngeBJUhOhU7zV+2JuQzbq1Z1auHvT3fcv+P7rJv
         n5n6MqQ8zp7NeLBAHCzedOOx4r8nOvysKttdTJQ5xBzzdnfAX6wnLzDhCPQiKt8q6o6s
         AzLkBu2mSHVIhmV2/oYkK7MJjyLk82Z+AKlaUYAqD01ySK7mQpj2bC72/STB+DeR8cCc
         cwbQ==
X-Gm-Message-State: APjAAAW2igbzrHVXx6rUetPEZXNi5KL8wwSq7Ia79C9prV5Y7CSdO3vE
        ST2n1gSDQ4ueNi1DrCLLJI9Fp1yd
X-Google-Smtp-Source: APXvYqyZMNX+LR6+bDqYiL9tl/43eqS0vtZYSSIV9plmqE/sbu9KgsxiJHkiMbIlroF/7vM/czeA3g==
X-Received: by 2002:a62:5cc2:: with SMTP id q185mr3605694pfb.221.1567689865910;
        Thu, 05 Sep 2019 06:24:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z25sm2633514pfa.91.2019.09.05.06.24.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 06:24:24 -0700 (PDT)
Subject: Re: [PATCH v1] watchdog: imx_sc: this patch just fixes whitespaces
To:     Oliver Graute <oliver.graute@kococonnector.com>,
        "oliver.graute@gmail.com" <oliver.graute@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20190905073730.22258-1-oliver.graute@kococonnector.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <016e268c-f289-4127-a47e-3d8faa790ded@roeck-us.net>
Date:   Thu, 5 Sep 2019 06:24:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905073730.22258-1-oliver.graute@kococonnector.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/5/19 12:44 AM, Oliver Graute wrote:
> Fix only whitespace errors in imx_sc_wdt_probe()
> 
> Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>

This patch no longer applies due to commit "watchdog: imx_sc: Remove
unnecessary error log".

Guenter

> ---
>   drivers/watchdog/imx_sc_wdt.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
> index 78eaaf75a263..94db949042c9 100644
> --- a/drivers/watchdog/imx_sc_wdt.c
> +++ b/drivers/watchdog/imx_sc_wdt.c
> @@ -175,12 +175,12 @@ static int imx_sc_wdt_probe(struct platform_device *pdev)
>   	watchdog_stop_on_unregister(wdog);
>   
>   	ret = devm_watchdog_register_device(dev, wdog);
> -
> - 	if (ret) {
> - 		dev_err(dev, "Failed to register watchdog device\n");
> - 		return ret;
> - 	}
> -
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to register watchdog device\n");
> +		return ret;
> +	}
> +
>   	ret = imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
>   				       SC_IRQ_WDOG,
>   				       true);
> 

