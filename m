Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C253017B0
	for <lists+linux-watchdog@lfdr.de>; Sat, 23 Jan 2021 19:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbhAWSjL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 23 Jan 2021 13:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbhAWSjK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 23 Jan 2021 13:39:10 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780A1C0613D6;
        Sat, 23 Jan 2021 10:38:30 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id s2so6383862otp.5;
        Sat, 23 Jan 2021 10:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9w1ACYrjetOei7hZUsBBvPCJPsWF7Ne5M1xRXd9d4sQ=;
        b=qZTihFUCVboiFghtWNilWnT4seuou1bvz2HBiIvesddva2V72V0vjEPlSuvXKpf7d7
         cNkuwP6MZYJ4gLOh2Ws7mLqkjE/wonlKYoPLpV5Ow7Z3YrsHCpIyPPRSQI0AzD4XDwS+
         WobQnB6EyH71uJ2ZeO9ZiX1aPwkJu5K3YJbpTRUrltIYRbUJytWdDrXW08cC883HjZXr
         DH/5Aa+xVQYPrbtR4/VxNZYTf0TLjqPVnlRetUS8DxDmGnNuYuiOiBnz7NQC2NJi+NGE
         Lra6t/7Xo37ByV35ovv93n9T8y3n8kZtfvZbIGOdbcQpdIF2HopzGFAmMlUfHmn57+bE
         L6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9w1ACYrjetOei7hZUsBBvPCJPsWF7Ne5M1xRXd9d4sQ=;
        b=A7ei+DsFIN1dIhtdJ9T48RI3XTNSzxR+wrDCijf+Hggn2dPTVlu97Zbb8Z7IxQaFWE
         XIPtCfDEaOBg0p4NVnDMs+G7SX07w4MtrBbFhUdfhNZ0XEyCHptYbqV2oSHwqrh5ai+7
         bpzKHAryFxTwpsPf5M+iSAU11lYngQL+AN8dpRlYFyptehasoKghjtNobbLSoi9rtDj9
         8VWaLKOvr73iCM4jR/HOtfArzqQj8Vw1ZxT4Cj73bQHRSL/oWDtMye1H7xSDlFC0RiBY
         NnGcjgYw+Dl9p0QcWjiDjLv5Pk2UCLMRbnPHvQ9rTSsq1gTWaGkV3Ji2vOUIqmlVtvtJ
         FTyw==
X-Gm-Message-State: AOAM533opm0gAiW37lqoJNOLC26psvmTrYJi6GOA2Gsa4md5C3A0BlR4
        Ti7O4IWB/WUJzev7SDsUwvM=
X-Google-Smtp-Source: ABdhPJzKUhl6X69rC8uzYMDjUWGzNYKUrqW/crUwIBle057SrecnEOULohMxPW2ng6zoVS0YK0jPRw==
X-Received: by 2002:a05:6830:1b6b:: with SMTP id d11mr7220330ote.254.1611427109905;
        Sat, 23 Jan 2021 10:38:29 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l10sm2445089otn.56.2021.01.23.10.38.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 Jan 2021 10:38:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 23 Jan 2021 10:38:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v7 5/6] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF
 drivers
Message-ID: <20210123183828.GA61238@roeck-us.net>
References: <cover.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
 <d4a658492fd9168a3e8a922b941f45f8ac23934d.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4a658492fd9168a3e8a922b941f45f8ac23934d.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jan 22, 2021 at 04:35:10PM +0200, Matti Vaittinen wrote:
> Add maintainer entries for ROHM BD9576MUF and ROHM BD9573MUF drivers.
> MFD, regulator and watchdog drivers were introduced for these PMICs.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since v6:
>  - no changes
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc1e6a5ee6e6..b59b7877258c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15336,16 +15336,20 @@ F:	drivers/gpio/gpio-bd71828.c
>  F:	drivers/mfd/rohm-bd70528.c
>  F:	drivers/mfd/rohm-bd71828.c
>  F:	drivers/mfd/rohm-bd718x7.c
> +F:	drivers/mfd/rohm-bd9576.c
>  F:	drivers/power/supply/bd70528-charger.c
>  F:	drivers/regulator/bd70528-regulator.c
>  F:	drivers/regulator/bd71828-regulator.c
>  F:	drivers/regulator/bd718x7-regulator.c
> +F:	drivers/regulator/bd9576-regulator.c
>  F:	drivers/regulator/rohm-regulator.c
>  F:	drivers/rtc/rtc-bd70528.c
>  F:	drivers/watchdog/bd70528_wdt.c
> +F:	drivers/watchdog/bd9576_wdt.c
>  F:	include/linux/mfd/rohm-bd70528.h
>  F:	include/linux/mfd/rohm-bd71828.h
>  F:	include/linux/mfd/rohm-bd718x7.h
> +F:	include/linux/mfd/rohm-bd957x.h
>  F:	include/linux/mfd/rohm-generic.h
>  F:	include/linux/mfd/rohm-shared.h
>  
