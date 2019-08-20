Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 632C096552
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 Aug 2019 17:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730654AbfHTPuN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 20 Aug 2019 11:50:13 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44581 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729820AbfHTPuN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 20 Aug 2019 11:50:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id c81so3623023pfc.11;
        Tue, 20 Aug 2019 08:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lYiV05ocruj81X/Vth9fboH+MCkm6RCCkzLgC1xVrmw=;
        b=fNasBHccmJLzP/62U4MV9sBWbQm7OW+UP4o3L47p/QOfrEwB12oFGN1SUeDNxTesTG
         oFVXAGPB/0yKLhB93KvtK39OGt91m5yjXxqiOI+Ne/g4PgiHtP6CnP+emNtm0S5AvRms
         wgLB3LlUTYNcu+oBWwl0mANSxbB8JPDz87T+ueLDw0vAvDTOpKYRKCXog9R0fmkLFIPi
         xzQou+UdcpRw5UdaAiachGeHx8UiMO5DSO/+NrOHHqD3BqcTTUABMqZt3SgFTXKwTSba
         S8dz/yisSiv/DmwTMJJoBD3YdQ0WsmL+fLh8i0MgTfW7wG4rpT5ju3QIDkhGNtSNHAG1
         7vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=lYiV05ocruj81X/Vth9fboH+MCkm6RCCkzLgC1xVrmw=;
        b=r8kTu+ocQIORktg5m+Py1UDWIdyXI5959ethvRI9YaRJK5jaOwJGaCvEoCARv/OLvs
         qpsmhjrd6l4zrVaZUtdhRqwQ8VOgYt6gz9lkAgiodX08+Wg3rZgJcirIifShd+L1L6r9
         mFBaLbNUR53fceZJHOpZeML3TMjttkKQduldRqxmy/NhY1ohKq4u4zMdkrNbcdISpe0v
         IG0QGPPeA7WAIVy5mbG1kAAuORIWhcH0Lt0zVEijJ3w64mrtOC/bCdnQb4bQVsK1gDX3
         BWGmiWzNRDygnGfE2xhvb6UQEZOG4iapq9cToESqPzfiXiGnA9hZZbvdp/G0YgKouHO4
         HzRA==
X-Gm-Message-State: APjAAAX+y0op+vrIdmwj09jiS68aW4l5q/XMPaqyiyFPK4UjTZAls6g0
        X5J8i1uEUSrt00pU3R8Tz+4=
X-Google-Smtp-Source: APXvYqzcVZHhyB9DOXrMXzkr2BAV66JOb9oS1kaW6MbhIGd5s+OPyrNHhQiJmgISgBG2USF+eV4rvg==
X-Received: by 2002:a62:f204:: with SMTP id m4mr31653953pfh.7.1566316212404;
        Tue, 20 Aug 2019 08:50:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a6sm399723pjv.30.2019.08.20.08.50.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 08:50:11 -0700 (PDT)
Date:   Tue, 20 Aug 2019 08:50:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] watchdog: aspeed: Add support for AST2600
Message-ID: <20190820155010.GA20408@roeck-us.net>
References: <20190819051738.17370-1-joel@jms.id.au>
 <20190819051738.17370-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819051738.17370-3-joel@jms.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 02:47:38PM +0930, Joel Stanley wrote:
> From: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> The ast2600 can be supported by the same code as the ast2500.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
>  Reuse ast2500 config structure
> ---
>  drivers/watchdog/aspeed_wdt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index cc71861e033a..5b64bc2e8788 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -34,6 +34,7 @@ static const struct aspeed_wdt_config ast2500_config = {
>  static const struct of_device_id aspeed_wdt_of_table[] = {
>  	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
>  	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
> +	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2500_config },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
> @@ -259,7 +260,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>  	}
>  
> -	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
> +	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
> +		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
>  		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
>  
>  		reg &= config->ext_pulse_width_mask;
