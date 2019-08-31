Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AED5EA44DC
	for <lists+linux-watchdog@lfdr.de>; Sat, 31 Aug 2019 17:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbfHaPBi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 31 Aug 2019 11:01:38 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43108 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbfHaPBh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 31 Aug 2019 11:01:37 -0400
Received: by mail-pg1-f195.google.com with SMTP id u72so842733pgb.10;
        Sat, 31 Aug 2019 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pgmHg3ukoYkhaRQ72n0KiU687Zs7MhjBlJ4ipL0qwQE=;
        b=B3bTo9nmMR/i7oh0IaQJj8OJoTDX+qoEGfM41Dt+zLDGc70vkBAsDR6WZJxYKyTByR
         ToqEQBhAvFzUGcgZYhC06n26Dv3l5QCPzWBTSZ7jb38S47K+8Ow0peFxgaasP+Fz2JKG
         /Xs4NfxIEhsZCMMcDQz0BBRKp9aJ2nq9R/odVV+jl+tDkopQs2p9N2JXnhi8626PsZiT
         JKloU3LculAz8V+r9ktvuT31bx+7GtcIuN1aDVs+g4sAIn/cqmDwxzDeyW21Z4GON4hz
         T7AIB3kalcAWUpCo78XZiuS0ACwNaYRjDOQmCLAGMe2ZUpdUd5gOEL9xIQ+CNCPoyOtK
         ELEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=pgmHg3ukoYkhaRQ72n0KiU687Zs7MhjBlJ4ipL0qwQE=;
        b=aUaigWzHfaS+tkn+ielILEbzfFrH+w8EWbJmcFN2IRE9xORCsNvKLufmTrPstyYcTd
         uWnOpt+bksQI0uQ3hIyuGUJuodmGfmwY5mrok7UyMW7aQAHjG46gN6tt2PPfy9EdY5wi
         1shQ2Ut3PXqK/cVaK35XT5MG1dmlViteKvW1x9nLJHLsEGbv7NyDK3kQb7pTIjjMvWWR
         rmDjnZck/i9F6LhQyPY96AvxpWhhua2OPGP4CDFg7zVO7zRN4e8g5XRVDQcb5xlz1Cv+
         fX3JUu17/Zae9DjRsJrjLOxIASe459ejz9cOMDncPbexL+wlrYB0fCQINmxKk99QG9ad
         bMOA==
X-Gm-Message-State: APjAAAVTyb1WgIGTqx7RHfXagAxF6s52JWqMeX2TzTsqzOcwdX0jG5gq
        3+EP7ngV/bbpnv+dFXd6cHR+A/0Z
X-Google-Smtp-Source: APXvYqzxO5TxxgJX3+CZnA8sNzId2Ur3EJ1lJTqlYglz6V20PPBYoElyIToU51GXQcMExZzVIgyYcg==
X-Received: by 2002:aa7:96dc:: with SMTP id h28mr24787013pfq.86.1567263697149;
        Sat, 31 Aug 2019 08:01:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t70sm9610914pjb.2.2019.08.31.08.01.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 31 Aug 2019 08:01:36 -0700 (PDT)
Date:   Sat, 31 Aug 2019 08:01:35 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Alexander Amelkin <a.amelkin@yadro.com>,
        openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] aspeed/watchdog: Add access_cs0 option for
 alt-boot
Message-ID: <20190831150135.GA7230@roeck-us.net>
References: <20190828102402.13155-1-i.mikhaylov@yadro.com>
 <20190828102402.13155-5-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828102402.13155-5-i.mikhaylov@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 28, 2019 at 01:24:02PM +0300, Ivan Mikhaylov wrote:
> The option for the ast2400/2500 to get access to CS0 at runtime.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../ABI/testing/sysfs-class-watchdog          | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-watchdog b/Documentation/ABI/testing/sysfs-class-watchdog
> index 6317ade5ad19..675f9b537661 100644
> --- a/Documentation/ABI/testing/sysfs-class-watchdog
> +++ b/Documentation/ABI/testing/sysfs-class-watchdog
> @@ -72,3 +72,37 @@ Description:
>  		It is a read/write file. When read, the currently assigned
>  		pretimeout governor is returned.  When written, it sets
>  		the pretimeout governor.
> +
> +What:		/sys/class/watchdog/watchdog1/access_cs0
> +Date:		August 2019
> +Contact:	Ivan Mikhaylov <i.mikhaylov@yadro.com>,
> +		Alexander Amelkin <a.amelkin@yadro.com>
> +Description:
> +		It is a read/write file. This attribute exists only if the
> +		system has booted from the alternate flash chip due to
> +		expiration of a watchdog timer of AST2400/AST2500 when
> +		alternate boot function was enabled with 'aspeed,alt-boot'
> +		devicetree option for that watchdog or with an appropriate
> +		h/w strapping (for WDT2 only).
> +
> +		At alternate flash the 'access_cs0' sysfs node provides:
> +			ast2400: a way to get access to the primary SPI flash
> +				chip at CS0 after booting from the alternate
> +				chip at CS1.
> +			ast2500: a way to restore the normal address mapping
> +				from (CS0->CS1, CS1->CS0) to (CS0->CS0,
> +				CS1->CS1).
> +
> +		Clearing the boot code selection and timeout counter also
> +		resets to the initial state the chip select line mapping. When
> +		the SoC is in normal mapping state (i.e. booted from CS0),
> +		clearing those bits does nothing for both versions of the SoC.
> +		For alternate boot mode (booted from CS1 due to wdt2
> +		expiration) the behavior differs as described above.
> +
> +		This option can be used with wdt2 (watchdog1) only.
> +
> +		When read, the current status of the boot code selection is
> +		shown. When written with any non-zero value, it clears
> +		the boot code selection and the timeout counter, which results
> +		in chipselect reset for AST2400/AST2500.
