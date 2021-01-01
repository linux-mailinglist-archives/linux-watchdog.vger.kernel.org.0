Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240E12E82C1
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Jan 2021 02:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbhAAB3T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 31 Dec 2020 20:29:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbhAAB3T (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 31 Dec 2020 20:29:19 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBDAC061573;
        Thu, 31 Dec 2020 17:28:38 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id j12so19215096ota.7;
        Thu, 31 Dec 2020 17:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nqTYURsZuNosp7QXLy1d+4/Lg7owmkjDgemSirLf0O8=;
        b=OBpHXDjH3ZWbdl1j6JYel4Rfg+SjCgJdzU+UmLFLM0Ez2bF5Zj6yBKB75qPXf/eSHg
         QtLTH0tU2epVH72kkFizk7eFUsMsfHat5k5zVTzIZD7RWlT5pNbNEAVYb2bXvrTUt3mQ
         g/9sMXZ1oDhIns5W9v1Q+6b3lWtmIEFQt4wklx73I48+qrlam4773I8NFHWyZ/T5U22x
         gdZL5kSTblTkywr/0aixFGM/sV0guRs/9WdbhNMTAAeqMjOAjP8MXfm6bSm9XEdoes5q
         kFNPuorOrSQa1UQXcoXvzGdw7U3d5FnLgsAVZbqdCFablogmnJOP3ox9W+p5rggVCvFk
         kh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=nqTYURsZuNosp7QXLy1d+4/Lg7owmkjDgemSirLf0O8=;
        b=Yu5vIdLsoD0MoLe1MbNaLGV7J69pKZK24+UlzggrVh7bVQSnn22LW56QZ9zZfdNBbQ
         a7Rak9uWsRIkiKWvYPiI6tNgoRq+Kw2sNdzFWJ32Bp/ASX0E8kqUhO+UW5v3z4S/pgl4
         3ZihBr2sBnsazlDwFYVpY+uG2Y1cZbqhM5Q5W1weYsMexxAdsjko4jzEcevNjnTVziBn
         la1ZfJGPVRURg4lh98KMktjT2aa1MKtAvgOUHNNB0f0Dv3Lh3/l6DFYbQJR57Lug/PU9
         Xks6FEuppBe1DAN7O50fGhtmEOfzhNn+Ub6HmtlSdKTKBEkTYYqcLV7yFtzui/e3GaFo
         XCfQ==
X-Gm-Message-State: AOAM533VTQtFlP8mA8BZyb6QTWlQVuXGUF9JeXJDAkY6S9bvdwpPn1tZ
        DXIaF4uw35pxWMw/iyDRQXc=
X-Google-Smtp-Source: ABdhPJyK2xr4CLSiYfimv85b2ILkMBMwDP2MyFbSRpiwBdmIprcYs5SIhdKU7gPQNzguqIf/oSIf0A==
X-Received: by 2002:a9d:8ea:: with SMTP id 97mr20145960otf.223.1609464518081;
        Thu, 31 Dec 2020 17:28:38 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t2sm8762554otj.47.2020.12.31.17.28.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Dec 2020 17:28:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 31 Dec 2020 17:28:35 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Campion Kang <campion.kang@advantech.com.tw>
Cc:     linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: Re: [PATCH v5 5/6] hwmon: ahc1ec0-hwmon: Add sub-device hwmon for
 Advantech embedded controller
Message-ID: <20210101012835.GA87441@roeck-us.net>
References: <20201231123948.10473-1-campion.kang@advantech.com.tw>
 <20201231123948.10473-5-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231123948.10473-5-campion.kang@advantech.com.tw>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Dec 31, 2020 at 08:39:47PM +0800, Campion Kang wrote:
> This is one of sub-device driver for Advantech embedded controller
> AHC1EC0. This driver provides sysfs ABI for Advantech related
> applications to monitor the system status.
> 
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  drivers/hwmon/Kconfig         |  10 +

[ ... ]

> +	lmsensor_data.hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
> +			"ahc1ec0-hwmon", adv_ec_data, ahc1ec0_groups);

New drivers must use [devm_]hwmon_device_register_with_info() and will
otherwise not be accepted.

Guenter
