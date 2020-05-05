Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB691C619D
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 May 2020 22:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgEEUJi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 May 2020 16:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727785AbgEEUJi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 May 2020 16:09:38 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD5EC061A0F
        for <linux-watchdog@vger.kernel.org>; Tue,  5 May 2020 13:09:38 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id a5so8481vsm.7
        for <linux-watchdog@vger.kernel.org>; Tue, 05 May 2020 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=JZfLiVbOazuTfcm+4u4Ye0gOFndtkBrreUkn1ry7gNBs4ECkgFDKdo/rHdu1AQBEAh
         nKFyCywESZj5Me5GBCATHxdJitFyX+6tAYa9RDi6KDchtEehsdOVIu9TApHb7HSPxGFb
         baKBP7c/tyVCnB2NH8zq6rKRHXhb/2wTgvjIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=fO1fsxaz/ebuDwlqNDjVYNDrmI9u5L/VT8yv5zKAYsMfie5lfCSat7p1iPfOxd7RkT
         KRdHOlWd61sP1/bTKGHHGIcJwEF+ab87wB986gS8fRPCbmnR65fu8GWys4gLnO0asXUo
         prGWz7C1HmHLZ7AOfdg42Ppd7wFi/DH7xvjfLAdxMfYrIu/IwUB41wkaVDIkVSfU9mSB
         hiStN9vB8IZ2I5QqxTzHyvxzsN152tR1rfz3z1ojQg2TJXy0arH+EDxn20Arh1yVa42u
         xho4/ou5y0YnVHPoXWIhZluYzyO0KsIa9o/laKSpcKsb4pT+STot7ooF+g9BmDMIitb1
         1D1Q==
X-Gm-Message-State: AGi0PuZI0tXJIXdlxwg7CM+MJd6FS6cVOYRmg9XrNJfWX0JGY8gTzF4p
        Nwdb7/BndT9hk7ERFDO/zshQogrZHfKYzhoUb2DaWw==
X-Google-Smtp-Source: APiQypJowiNqq0i+QKhqmj//hMMvq70bO2RQ9UV0gMFrlpNrwuxFoMcSnTC6aIq3Ry7VS3vRYjcYHV/I6y+hbezoCRQ=
X-Received: by 2002:a67:de0a:: with SMTP id q10mr5173302vsk.138.1588709377331;
 Tue, 05 May 2020 13:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200505031331.122781-1-evanbenn@chromium.org> <20200505131242.v6.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
In-Reply-To: <20200505131242.v6.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
From:   Julius Werner <jwerner@chromium.org>
Date:   Tue, 5 May 2020 13:09:25 -0700
Message-ID: <CAODwPW-9Yz5zBpSTGOuXzZnhkze+CX5hDAegMQiXs-d=cPgNWw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Li Yang <leoyang.li@nxp.com>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Reviewed-by: Julius Werner <jwerner@chromium.org>
