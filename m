Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0251708EE
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2020 20:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbgBZTbD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Feb 2020 14:31:03 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:46874 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbgBZTbD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Feb 2020 14:31:03 -0500
Received: by mail-io1-f66.google.com with SMTP id e7so366118ioe.13
        for <linux-watchdog@vger.kernel.org>; Wed, 26 Feb 2020 11:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5MFxJeomCczgXDzeNV9Xn+RHt64mPvJ12qZr3RbPrbU=;
        b=dWcCF8s4J9A+iP2iXoWcm3srPwjEatU3HdSYDIVsbNOiHHd7MtnwyuiE9mCNcHaGU0
         qwCoH2p/6/qrCzG/i3ueu4EZqypRCXV4NQTLYaswGjHLOJWyjjeUM9SXiYcQxeTrcELD
         ACUWcICt+Ximqv6VZnywYGgK6FeUCdHP4Ttig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5MFxJeomCczgXDzeNV9Xn+RHt64mPvJ12qZr3RbPrbU=;
        b=II38UN8NKZo8NmxxCfBkO8MFEgWnY+rbjInl55sAdeo2MBJYG54XfGheGTR4/pJ6hS
         f7KeM+Jp4VFseU4ziDx3/dofqHP3fyqVObe39nSxUglULCNCSmu4I9M8fpOlfBHq6hyv
         oR0W7bfhRJn+CI6TNBKGC9f5pYIzVmbNwObgt1GhAFPuuhc31jhKim6wSF5OzcmEVUrX
         MalPiD3695bzYr6l5oRQWjUWBmeNzTgLQ69JegckmQA0UDz5IX5oBCVlQ465pYbBoXCe
         1Cepl1Y4DstYXXSGkxw9VTnbY7PGKJHT7TLoRJiTVDRAm4eRhjHWRShcugLCEonryIvZ
         r0lA==
X-Gm-Message-State: APjAAAVdtMAcTx9BhdOQPz6fp6QJ/i9oWoClpSQoaJ/awpOBloot0Gio
        CjITWtG4dWtg0Vt8dkCRxQJZB3U+NOyOT8+V95lyCg==
X-Google-Smtp-Source: APXvYqwm7wEEXPS3MuEPhTwwGRUEbcd/4WOJm2XgfK0kRKisj4w+h5pA1wDFpztH3aEcTh+AhwR4v0v1+qCPqLGRK8w=
X-Received: by 2002:a5d:8955:: with SMTP id b21mr146927iot.41.1582745462529;
 Wed, 26 Feb 2020 11:31:02 -0800 (PST)
MIME-Version: 1.0
References: <20200221053802.70716-1-evanbenn@chromium.org> <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com>
 <CAKz_xw2ETZ5eyNfdWU5cF6Qy23E1NqhpFHoLT_CzUDHWTCbw4Q@mail.gmail.com> <CAL_JsqLYpSK6HRT4s=hq153xvU_aiPCq3Hk_oZC-7X7e7daA7Q@mail.gmail.com>
In-Reply-To: <CAL_JsqLYpSK6HRT4s=hq153xvU_aiPCq3Hk_oZC-7X7e7daA7Q@mail.gmail.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Wed, 26 Feb 2020 11:30:51 -0800
Message-ID: <CAODwPW_FR0gHO_=yfCPwETXvKG9CvgvPddX-EOT=OXDPEkp_Kg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173,smc-wdt watchdog
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Evan Benn <evanbenn@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org,
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

> Not quite. /firmware is generic container. I'd expect another layer in
> the middle for the overall set of Mediatek firmware behind smc calls.
> Look at 'xlnx,zynqmp-firmware' for an example.

There are no other MediaTek firmware interfaces described in the
device tree on those platforms. Is it okay if we just call it
/firmware/watchdog in that case?
