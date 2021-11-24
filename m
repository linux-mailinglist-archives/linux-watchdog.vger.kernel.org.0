Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FB445C7D9
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 15:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347025AbhKXOqL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 09:46:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240993AbhKXOqE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 09:46:04 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45929C06175D;
        Wed, 24 Nov 2021 06:17:44 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id bf8so5625379oib.6;
        Wed, 24 Nov 2021 06:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1bTyT2WPKZr5i6ZzvwJQ6FSjU066tTSM0A1BNoRZhrI=;
        b=GjKyzKX1rzk7ASEz6L48pqKxHWWwlGh6v5M59UVkuasWtShJ8FKsoabWyFciUO2wxS
         7BQROiLYeWUMoqI8ZZSbnZY4EGRj6G3BAESYcwjv+ErLyEFhnhjBbHuYtZWo0IdMZ9GG
         TWkfSz+dvrGKnVdjlRiT1jzxK01oWnZbA7Dp/DLoOByzjZQFdm20/IbFOmARvJnkyhYb
         iYWaY9465y8OMdeoKY7PqphZZhnqRvizpuntgiw2uVUumzqeNj7ZCyHNNKFTHej9q1FW
         R9aKKMScSWytss+qMZY0rnDQyADnRaZ+JE7I67VWUc62iIocvdWVMJ1JJOjJBB+WrV4A
         Wd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=1bTyT2WPKZr5i6ZzvwJQ6FSjU066tTSM0A1BNoRZhrI=;
        b=xRZvm46hwMeD3CstuevWKPzFfFZ0wCCiYPdutzeriAv7ajoKz+zLBDhh7BNwRS9PHt
         ymVA4sJjx5+d2S3X7oD+vt0V3pEGDA2uxoJegiSGwCnJCQmjmEumcUxRVsgdRP7QHzlO
         o38kWjPPRzDTkRinxetBiieUuyi0Ia7YP/HQr63v+OVwihyRw6R9qKRCWFaoHya6Mrj1
         4d8dMjnbtmwrWveISFAYuopCkg47RzG4zGkCKWxRjlWbkfoTcqRpFOC5wLAgndF7VhRi
         fJjFHU97WjsWELZ3hSRtd6QhFkaAJWl9hzmQC3AKkhCTas047wcioF7V+6pJSZY1KDK6
         eEzw==
X-Gm-Message-State: AOAM530ozhmi0cPZrsYFAz3bya4IsvqWQO7ncxmbTkOdTtRpFv5ziKKr
        tbl1MSDIwItVPkN/KL/ForQ=
X-Google-Smtp-Source: ABdhPJzf3Jnskau+AwFmmL97KgcfKyfNSqrLxIzFMLKjipEtXeBjK9jLvoSAw72SXstT+7hP5HesXQ==
X-Received: by 2002:aca:af50:: with SMTP id y77mr6361180oie.134.1637763460077;
        Wed, 24 Nov 2021 06:17:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k16sm2791019otp.21.2021.11.24.06.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 06:17:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 24 Nov 2021 06:17:38 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xiantao Hu <xt.hu@cqplus1.com>
Cc:     wim@linux-watchdog.org, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        wells.lu@sunplus.com, qinjian@cqplus1.com
Subject: Re: [PATCH v2 0/2] Add watchdog driver for Sunplus SP7021 SoC
Message-ID: <20211124141738.GA3802978@roeck-us.net>
References: <20211112105952.216280-1-xt.hu@cqplus1.com>
 <20211124104149.361019-1-xt.hu@cqplus1.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124104149.361019-1-xt.hu@cqplus1.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 24, 2021 at 06:41:47PM +0800, Xiantao Hu wrote:
> This is a patch series for watchdog driver for Sunplus SP7021 SoC.
> 
> Sunplus SP7021 is an ARM Cortex A7 (4 cores) based SoC. It integrates
> many peripherals (ex: UART, I2C, SPI, SDIO, eMMC, USB, SD card and
> etc.) into a single chip. It is designed for industrial control.
> 

Why are more and more people sending patches or patch series as reply to
previous patches ? This all by ensures that patches get lost.

Is that promoted somewhere ?

Thanks,
Guenter
