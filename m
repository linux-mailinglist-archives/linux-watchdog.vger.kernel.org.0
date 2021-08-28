Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470703FA6B7
	for <lists+linux-watchdog@lfdr.de>; Sat, 28 Aug 2021 18:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234519AbhH1QNl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 28 Aug 2021 12:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhH1QNl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 28 Aug 2021 12:13:41 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C33C061756;
        Sat, 28 Aug 2021 09:12:50 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso12123677ots.5;
        Sat, 28 Aug 2021 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oqM0CBe8rMehZYKGb94oPst4K1wbWkQ+6gjX8wFUsVY=;
        b=B+ZChttajmzKetOgH7kY5xw7Fq+MJAXgk1LNtOlyE5eElmzb0aDJRJelNsC55+/Q7d
         xu3GqdnAl2eEaot8pvs2vUJfmXxvhyUN8P+2AR7ILX4BAK9wcpvlK1+sO1IEDOnafgAH
         xmlF28tRD9b/H4AIEmRBfTsFppm6/AvEgOJrnnYOdaUgMigeAViiaNGN/CebWcXk2Qhv
         GNlawOVFEOUNVyPHXuYw2HD8EYkOL1/g7nRl5/IdKvAbAmDWAS47zIRUIpWenN3+lVyi
         N57P2uC+D3o/5deZrVzl7B+XhfsTiyivBYrCtI2pZg7FHtuZP7DL1KyJJJZ82vlVKgLi
         Ityw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=oqM0CBe8rMehZYKGb94oPst4K1wbWkQ+6gjX8wFUsVY=;
        b=oB1gnd/BtENS+4QQxjqlZ7gC27tYSo2pfB3qi/aVkEdRvvT6GZWG1/EnJD9Pp++Ji9
         zHyzZufQ1x7Peg7V5McCP0NBxWVq5HGtFA55wNvgbJcUxt14zpeR3YCT/6aEegCB9NGi
         lD+O2KL8V5U27ohKM9xfd+iyXyUe2p9Ve7UizK/mZxqENsFZkpOwMhpRCdMfnMFmjXpd
         ClM7VU92FKJ0qvGa58DKn0Rh6qvhrQ7dr4jETDg4cNRChtgCtPLjMzCHkhXR7XCoqzep
         9tAnSH2NAbSq1sv4e03rRdDtMd2Q8aGV42acc/4Aj7nJd8NeMzO41JOGnuuetyF14NHC
         jTPQ==
X-Gm-Message-State: AOAM531Og70pz42dgu200lWOGfIOjBezXiry8h5axGws7Nyf6RQmijBH
        6O9Vn7U0BFVT1kz/1joRf8w=
X-Google-Smtp-Source: ABdhPJzxR1nYZP6dtl+O65gPcYJrXTHsc9z1t/xbTIEHnFoMBqINR11VITtK23mnj/DFlwdbgZfLJQ==
X-Received: by 2002:a9d:6e91:: with SMTP id a17mr12447967otr.372.1630167170294;
        Sat, 28 Aug 2021 09:12:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b11sm1831888ooi.0.2021.08.28.09.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 09:12:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 28 Aug 2021 09:12:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v5 5/7] watchdog: f71808e_wdt: migrate to new kernel
 watchdog API
Message-ID: <20210828161248.GA822720@roeck-us.net>
References: <cover.3654d10d79751f1b01adc9403f9840543df4bcc4.1628525954.git-series.a.fatoum@pengutronix.de>
 <35d9dbf57b58c5f003cef31dc256ec2fec044524.1628525954.git-series.a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35d9dbf57b58c5f003cef31dc256ec2fec044524.1628525954.git-series.a.fatoum@pengutronix.de>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 09, 2021 at 06:20:35PM +0200, Ahmad Fatoum wrote:
> Migrating the driver lets us drop the watchdog misc device boilerplate
> and reduces size by 285 lines. It also brings us support for new
> functionality like CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED.
> 
> This incurs a slight backwards-compatibility break, because the new
> kernel watchdog API doesn't support unloading modules for drivers
> whose watchdog hardware is reported to be running.
> 
> This means following scenario will be no longer supported:
>  - BIOS has enabled watchdog
>  - Module is loaded and unloaded without opening watchdog
>  - module_exit is expected to succeed and disable watchdog HW
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
