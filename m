Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9418E892B
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2019 14:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388105AbfJ2NQF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Oct 2019 09:16:05 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34737 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732534AbfJ2NQE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Oct 2019 09:16:04 -0400
Received: by mail-pf1-f194.google.com with SMTP id b128so9584953pfa.1;
        Tue, 29 Oct 2019 06:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rDAR1qdS022RvDkmF/JnXqxkZXLKSYyvZ7xcekyeQEQ=;
        b=eFGkqYc9CHYLgbmA3fBDUR1b/S/CZSuonfyOXIMsqiMhbvkZHuIooxlXyn0gs9U7VL
         R+F0FX1Onv2Lp04JJ+tfAH4Oe1iwhW2HIyHFzIQTjhfK+Ual3E5OKVEwDpIN4ZllRZT4
         valJ+V1d+e3oYEm+Le38OCeDKuPzD5w3j01+dfPvRltNESEOodVpZz9GJ/ouQjOEzrJ7
         fqzkKjZgN6849koIqlr5cODaGYOa2NUipVjGP1B6mx2i64HP9bjAx63zUTjDTsaFlFWb
         p637UTy1OKl9fFRCOvHOYrB/x9N23wr/ZMNH42opv72gVaBXqwlYpfYBVeyVIyE5+1dY
         8GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=rDAR1qdS022RvDkmF/JnXqxkZXLKSYyvZ7xcekyeQEQ=;
        b=BSWAuYofDcGW5ittNNrVmjS3uldIou/25RNswg1t5Yr62cK6W1qQxhL5bXzvRrWBg4
         Eoo2qOgpy3jkv3+oiDMmmI6YDY0VV/bzANfBIoPmkFyOUT+w0TJbUQz3Qg2rjogmhFQd
         KE41DKjpqTfz5SuxSV6AONwLyTt1+L3ZYehohZdJZlV2A/ErxTMDkckziGHYRyR4Tfe6
         wgVAPutFO/vErDiymRmNAD4fU/jm+mHNIeZdNsNwvlqMca1Ux7Nv42ta2c9OJWY+b+nU
         lqBwFuFtDtdAYg5boERpn2r/dBWeGHGtEYMmlfX1bXAGdg0n6nayJbLqwx2P5Z0ptVgB
         dGEA==
X-Gm-Message-State: APjAAAUcCQMx87le8uZfefbyF+8BKIaql0Ja590HLR1NPB9pdD4POkMR
        qkzZzjnuJNdzycIuJyekxruv+WqU
X-Google-Smtp-Source: APXvYqwk+TvBib/ARH05rzylFT0CcwN0b5rW/UeVrjgST/fD4Hn45Ia/UxXDOz4CLpn9Rqlnwb2VZA==
X-Received: by 2002:a63:234c:: with SMTP id u12mr10783800pgm.384.1572354964074;
        Tue, 29 Oct 2019 06:16:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 16sm10728832pfc.21.2019.10.29.06.16.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2019 06:16:03 -0700 (PDT)
Date:   Tue, 29 Oct 2019 06:16:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugen.Hristev@microchip.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: sama5d4_wdt: add
 microchip,sam9x60-wdt compatible
Message-ID: <20191029131602.GA8372@roeck-us.net>
References: <1571648890-15140-1-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571648890-15140-1-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Oct 21, 2019 at 09:14:05AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> The Atmel sama5d4_wdt needs to be compatible with microchip,sam9x60-wdt
> The sama5d4_wdt driver is updated to work with both hardware blocks
> (sama5d4/sama5d2 and sam9x60 based blocks)
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
> index 4fec1e3..44727fc 100644
> --- a/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
> @@ -1,7 +1,7 @@
>  * Atmel SAMA5D4 Watchdog Timer (WDT) Controller
>  
>  Required properties:
> -- compatible: "atmel,sama5d4-wdt"
> +- compatible: "atmel,sama5d4-wdt" or "microchip,sam9x60-wdt"
>  - reg: base physical address and length of memory mapped region.
>  
>  Optional properties:
