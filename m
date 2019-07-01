Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0178A176BB
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2019 13:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbfEHLYY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 May 2019 07:24:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37875 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfEHLYY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 May 2019 07:24:24 -0400
Received: by mail-wr1-f67.google.com with SMTP id a12so16599883wrn.4
        for <linux-watchdog@vger.kernel.org>; Wed, 08 May 2019 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1ZGlp40IsYtFAaBk0HZMbzf6li3dlBM1JeMgqqz53qI=;
        b=dLf0GeJ5oO2/qzJ2OPJsKrWb1jddayoko2NnzJa2Ao0wHEnYkkD8bC0lix+E4KUog5
         HOSpNmLXFhms8Zmf2MqLUVR/SIre28mjmpqCw0GpbXExy/GCCt6KMXZV0hBW2LdlWKwT
         7ZFCxPZpm7P84TjCBKoZGANS9gelWb+IKZbJatQAyAoRb8MH+1nr64aMFbyvnGBfXJwr
         GqslgS+cGoVeRyvj4mPtx+uWfDCQQW+nOpgXrXe/dZQ/R3ho6OE4oZ55uJS8+bpTiD4+
         1Ae5IR323BjGtWXzuIoKQfjrO7/XwnCxaL67+t4ZWnZk5Rhm+IhvBeQFLh3eU4b4/E0I
         a/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1ZGlp40IsYtFAaBk0HZMbzf6li3dlBM1JeMgqqz53qI=;
        b=twN8gePzdBSMaLxO8569XLh1wm7OMLPgwVqd/LYRA5GbTmSMrEmSEs1qjalSSPHBIz
         AtxFW2yHGF1SXUmsKoWz+sNR+I0fHEJi9/KUGHX8iYWEO6g55EKVmmGM618iiVDxIqAT
         yVVrzHqpfEaVW7Jy4LheUL/nj84mPf161TIdBrFFRmKWUT+a+juqMYQ5Yd6XxH20nY+3
         vE/82sjUTRbtJlakuIb9YLE18wOnB0UX4mpUKFSFCJwPdEsXZPFJ/KTpdx00Hw5kl6LK
         au8aSf2Etcmo97zagG6br9tZdwq5ggpeX2Z0BlYtFDIaRyca47SIk5nn0ugVQQb+cJx6
         tRYQ==
X-Gm-Message-State: APjAAAVZKyqkASLckzt00sF0P7xEad66qiJG1ANZjnNbZdvK514JLBmb
        SFq+4sU4o9FVQ5OtZHQmXLs9zg==
X-Google-Smtp-Source: APXvYqwRRnCpg9Buqa4k1dpgkoWwP+tLwA3WGNYrjxvZ7tkjnD7LulMPynsnUSKYyb73BEvs2F6yFg==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr20468589wrn.175.1557314662357;
        Wed, 08 May 2019 04:24:22 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id i17sm3726274wmb.0.2019.05.08.04.24.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:24:21 -0700 (PDT)
Date:   Wed, 8 May 2019 12:24:19 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
Subject: Re: [PATCH v14 2/8] mfd: bd70528: Support ROHM bd70528 PMIC - core
Message-ID: <20190508112419.GU3995@dell>
References: <cover.1556787930.git.matti.vaittinen@fi.rohmeurope.com>
 <a666794d68b846a5527fc37e80cce5010615f54a.1556787930.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a666794d68b846a5527fc37e80cce5010615f54a.1556787930.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 02 May 2019, Matti Vaittinen wrote:

> ROHM BD70528MWV is an ultra-low quiescent current general
> purpose single-chip power management IC for battery-powered
> portable devices.
> 
> Add MFD core which enables chip access for following subdevices:
> 	- regulators/LED drivers
> 	- battery-charger
> 	- gpios
> 	- 32.768kHz clk
> 	- RTC
> 	- watchdog
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
> Changelog v14: No changes
> 
>  drivers/mfd/Kconfig              |  17 ++
>  drivers/mfd/Makefile             |   1 +
>  drivers/mfd/rohm-bd70528.c       | 316 ++++++++++++++++++++++++
>  include/linux/mfd/rohm-bd70528.h | 408 +++++++++++++++++++++++++++++++
>  4 files changed, 742 insertions(+)
>  create mode 100644 drivers/mfd/rohm-bd70528.c
>  create mode 100644 include/linux/mfd/rohm-bd70528.h

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
