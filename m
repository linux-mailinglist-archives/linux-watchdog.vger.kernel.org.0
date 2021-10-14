Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3057B42D2D5
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Oct 2021 08:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhJNGmA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 14 Oct 2021 02:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhJNGmA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 14 Oct 2021 02:42:00 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D59DC061570
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Oct 2021 23:39:55 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m22so16178822wrb.0
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Oct 2021 23:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1X3q10Ut9LMfIlD42uRdlUEW0fJ6KIcyiarCdAlNux8=;
        b=CqRxnAZDPHYgayvtvGH+9dWRE9fJp6fhtb0euc++oQSnVhpdx0Zvnh3h8Di+yYI+wa
         yowflxYX1uT6sU27jYcyLTcFwmG/VnZDfzsaC3nryRXC2GN1sp1H6TtcNPk0UvLJrr5L
         DwCILDyFbNbTtQ8Mn9rueJtjZewJZ3A7AJoPVSMRt3KpVU+llnNV4Hv8CknpYw5VgzPI
         WEkZQaFHrMr29vhKe9OfXJAdVh3+JcoFc+Rk6H4DsvKgOHcsTE5KjiyXmb8xKTZxL5m7
         Ff+OVp5H+Rse2x73cfW4PLSymgo8xMXQgtj5S8EXWQMVH4ak5qEQ7tVtTJnMhF1JjaJd
         BA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1X3q10Ut9LMfIlD42uRdlUEW0fJ6KIcyiarCdAlNux8=;
        b=3AdLbwgIPXeGnNVJqsJQYiZrqaYOLTVtDsaK/CFDYo4/RMDMH4p1zCQaMpvlZvpBtk
         W6npieb3PPnGduAThWVWXvTgfshUKwEphVQ7MR4MTwCwC8Y9MBsxxdaE2i/qRQxKqrPg
         ykzrhpO2ZAthyVwifUA/V1nC04ajan0VO2vOADpu0cjqd7N4Zrlsm2udsB9U7MKaXoJk
         Ywj5VyLUcGIWzNR+gccyEKoK5dbBkLSrm5WpEovyv33YdVwdJL8EgSb26zvw5g7Ke6Oy
         trofQaUkue+Q+eQ31KtMjt6WyxRCzjuJt76LKPKF1zzRmA3Hx99khfocSDymhSfOSIVJ
         Hs9w==
X-Gm-Message-State: AOAM533xXiPA2rAsP2WP4yKsfMy31FZKB3TGZf8pLWPXZjlRrjtTNNuK
        N7k93s8Mad0wMia5qFzdk7/DhSIwGzp8YA==
X-Google-Smtp-Source: ABdhPJzdKuydL1xJ5GuUOVWSCh1H0cNjP6WHkDwFH5k8W5Smo0H0OnF6OUzcZkXIPY7EEM47G/b/Hw==
X-Received: by 2002:a1c:3847:: with SMTP id f68mr3811071wma.152.1634193594170;
        Wed, 13 Oct 2021 23:39:54 -0700 (PDT)
Received: from google.com (176-35-142-29.xdsl.murphx.net. [176.35.142.29])
        by smtp.gmail.com with ESMTPSA id x21sm7102653wmc.14.2021.10.13.23.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 23:39:53 -0700 (PDT)
Date:   Thu, 14 Oct 2021 07:39:51 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 3/3] watchdog: db8500_wdt: Rename symbols
Message-ID: <YWfQt8V2YNMr4t8F@google.com>
References: <20210922230947.1864357-1-linus.walleij@linaro.org>
 <20210922230947.1864357-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210922230947.1864357-3-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 23 Sep 2021, Linus Walleij wrote:

> For conistency and clarity, rename all symbols and strings from
> ux500 to db8500 in the driver.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Lee it would be perfect if you could ACK the oneliner in
> this patch along with the rest.
> ---
>  drivers/mfd/db8500-prcmu.c    |  2 +-

I didn't even see that it contained this change.

No problem.

Acked-by: Lee Jones <lee.jones@linaro.org>

>  drivers/watchdog/db8500_wdt.c | 76 +++++++++++++++++------------------
>  2 files changed, 39 insertions(+), 39 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
