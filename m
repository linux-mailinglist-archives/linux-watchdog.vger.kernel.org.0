Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94D69165813
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2020 07:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgBTG6D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Feb 2020 01:58:03 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:56251 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgBTG6D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Feb 2020 01:58:03 -0500
Received: by mail-pj1-f66.google.com with SMTP id d5so462752pjz.5
        for <linux-watchdog@vger.kernel.org>; Wed, 19 Feb 2020 22:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qjx6aSF/rYbAiv0EvUOF/ZsAzxN0pfEVgpw7b59ljRE=;
        b=H62U5hBEbjiE4TCDoMRdK1Jd86R01mh7rJVbO8yWo1j8QYD/F0egNJdaQLiP9Y68O5
         J/NusiLUwR1RZUPv/eH48umnaBo3GiMrY2T0F2hqxf7/FPBwgnWh9uliywhNTtlQ9pFl
         OoDa0qXB5F1ze2QjirWfLhJsuDuYbP/eA6fYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qjx6aSF/rYbAiv0EvUOF/ZsAzxN0pfEVgpw7b59ljRE=;
        b=mqiIyg5NAuSePiVDzOvCKmF7RKIyxaAaer5VmPz7cgzAqlumrT79qYIrXY+uN8l6dq
         ezjPweg6vS49GvldLsmaTPu2R7V3SCmfzishttK9J3vuJzBcm8P0R//evPHPiGq57fyC
         nGbiweGiiieEcbupARKEAeHWji75theJJDY8oXOOPQR7IT3nWVBv7A7dHVdtevTTwCwY
         CeQuuMVfuYQZduZ68Fi+MkPHvv/G1jy0/qKB1wvErn5JwbuSXXhzb+NHByMd80fcX+3t
         zgPM3qHuCDBAhZOPCpKYzwoTBtvbN56pUCgFPMdtfbUjlAA1iPNMbyHIMFgHq8LkDAQ3
         4epg==
X-Gm-Message-State: APjAAAWHYTxy36eDP/d08arHPgC94guomVHiGdA6Q0MzSVC8sQjCN0V8
        nPdCLwMWHNb22oZzzHvL9smvN7orLvQ=
X-Google-Smtp-Source: APXvYqxe0Tje4BrGjBQobxBgA3cfe74wO55HqfEtQS3YN0gF/px5OyCidVZbU5feyDBRPw5+S2ZGTQ==
X-Received: by 2002:a17:902:6809:: with SMTP id h9mr29582100plk.32.1582181882745;
        Wed, 19 Feb 2020 22:58:02 -0800 (PST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id s7sm2001733pgp.44.2020.02.19.22.58.02
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 22:58:02 -0800 (PST)
Received: by mail-pf1-f173.google.com with SMTP id 4so1430083pfz.9
        for <linux-watchdog@vger.kernel.org>; Wed, 19 Feb 2020 22:58:02 -0800 (PST)
X-Received: by 2002:a67:fdd3:: with SMTP id l19mr15726222vsq.42.1582181429665;
 Wed, 19 Feb 2020 22:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.2.I7c8247c29891a538f258cb47828d58acf22c95a2@changeid> <804d3cc5-688d-7025-cb87-10b9616f4d9b@roeck-us.net>
In-Reply-To: <804d3cc5-688d-7025-cb87-10b9616f4d9b@roeck-us.net>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Thu, 20 Feb 2020 17:50:03 +1100
X-Gmail-Original-Message-ID: <CAKz_xw0fHgVBLdEoEoQ7OSAgBcvYBAowV0obWLsDUGNPotP55Q@mail.gmail.com>
Message-ID: <CAKz_xw0fHgVBLdEoEoQ7OSAgBcvYBAowV0obWLsDUGNPotP55Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Olof Johansson <olof@lixom.net>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-watchdog@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Anson Huang <Anson.Huang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> > +     if ((int)res->a0 == PSCI_RET_NOT_SUPPORTED)
> > +             return -ENOTSUPP;
>
> -ENODEV would be better here.
>
> > +     if ((int)res->a0 == PSCI_RET_INVALID_PARAMS)
> > +             return -EINVAL;
> > +     if ((int)res->a0 < 0)
> > +             return -EIO;

In fixing this I found drivers/firmware/psci/psci.c:145
Which also translates psci codes to errno codes, but uses EOPNOTSUPP:

    switch (errno) {
    case PSCI_RET_SUCCESS:
        return 0;
    case PSCI_RET_NOT_SUPPORTED:
        return -EOPNOTSUPP;
    case PSCI_RET_INVALID_PARAMS:
    case PSCI_RET_INVALID_ADDRESS:
        return -EINVAL;
    case PSCI_RET_DENIED:
        return -EPERM;
    };

    return -EINVAL;

Are these more appropriate?

Evan
