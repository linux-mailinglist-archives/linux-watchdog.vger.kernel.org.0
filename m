Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5577DA44D5
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Aug 2019 16:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727905AbfHaOw4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 31 Aug 2019 10:52:56 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46511 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbfHaOw4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 31 Aug 2019 10:52:56 -0400
Received: by mail-pf1-f195.google.com with SMTP id q139so6403901pfc.13;
        Sat, 31 Aug 2019 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9BDuDRjmF116OgtDaHNeOzO00s8uzxNdezpyBuRSAeQ=;
        b=kC6LfR9kBk1TZjb1CVjCLOPJJm+I4pY1IDqTkD2ktfZ9E6LJl3xMN5KYJdrLrjVZDH
         Zx6eEptthNTXQtoISm9+zgEkF/uDSn/GP8LXPZAfLjVtSvRiRPpEeIAaEtUqiy64UQ7J
         T7ortflVdD9g1ZRmTwvR1TDWIUokzUPmvrQ/8RbRGwG+vM82HogHrtycaXCYMMGusGjD
         M3Iy3Z79Q4ugJbkD1tmXDBFj2+D4woKp7DjCAR7ReyePDNQJGpzTzQ21vVB99wT76sau
         ebX5VH80r39qQGEXKM3i8SSudG+p42fpvLyvyZC5xO38X+ZfjDAiK2pSn6zQFydkWthv
         r1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9BDuDRjmF116OgtDaHNeOzO00s8uzxNdezpyBuRSAeQ=;
        b=b6GBUof8hvLSx0SScaqAm+VieHHJckz4Wpo1o/mKkHpTzz69k62Zwnmx0IAHuDrf9p
         OU0Tm4F6qJze4q2o9IcrgzKsh6tcPD3qEDlHxyKHlTaqPdTcf/hQYpqia6zdra/4Ov0/
         zUIxT14oOYEY0G7LGgyxvcr186+urehWeIBQPLCx8jzGrnBq4jDE3dogX0P/HCUysdSk
         iZen+gKiT0E3LCCWb1zxtXltk39XMcX7aKK0OmV4Mf/Q/DipMwpwKNxugrlVHn1KbsZG
         bAINtdxHwEduyAgzjV8zv9fPeII6iRFlBAfLw8aY1LBgfGSrgmJxh45v+jL/kCVSWtcl
         j46w==
X-Gm-Message-State: APjAAAURGz5QjdcmGThZQ0EK8LNCtneklYrU4ov/Y0JhMNKXlAMMmD/1
        iWJp8tjUJ+BLqmWwHQTzIgjN6R2S
X-Google-Smtp-Source: APXvYqz8+XI6fkaN065GcPbaUGwdNg8Rs/XLz0t7x/vxuFhL+XJ63s6WVe7ccozksx2DwOh7IAdxKQ==
X-Received: by 2002:a65:4c4d:: with SMTP id l13mr17260595pgr.156.1567263175393;
        Sat, 31 Aug 2019 07:52:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e21sm10121157pfi.13.2019.08.31.07.52.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 31 Aug 2019 07:52:54 -0700 (PDT)
Date:   Sat, 31 Aug 2019 07:52:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Joel Stanley <joel@jms.id.au>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add ast2600 compatible
Message-ID: <20190831145252.GA6062@roeck-us.net>
References: <20190819051738.17370-1-joel@jms.id.au>
 <20190819051738.17370-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819051738.17370-2-joel@jms.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 19, 2019 at 02:47:37PM +0930, Joel Stanley wrote:
> This adds a compatible for the ast2600, a new ASPEED SoC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2:
>  - Add Andrew's r-b
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5077a1f5cb3..d78d4a8fb868 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -4,6 +4,7 @@ Required properties:
>   - compatible: must be one of:
>  	- "aspeed,ast2400-wdt"
>  	- "aspeed,ast2500-wdt"
> +	- "aspeed,ast2600-wdt"
>  
>   - reg: physical base address of the controller and length of memory mapped
>     region
