Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B23D317012F
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2020 15:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbgBZOaK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Feb 2020 09:30:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:39914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727426AbgBZOaK (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Feb 2020 09:30:10 -0500
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FAED2468C;
        Wed, 26 Feb 2020 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582727409;
        bh=FTavrhRvD3/cAi6dtPOZfJq/yT2BV2F/rKEuNXloXiw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UgKEAOVPqCjEnalnG/MJpctIDGJWpzc2VZ3liqn3FBmTSyRcGR6x0QQxl+hDA8K7m
         0N/mJRIgoKmlNj5OsWGP15UXTpGPisYFxZ62tjsvVR5qzCWQS5DYFn4Ij5KrMu0G8J
         JQK2IWg89VZASe7ljBjnu5MKAJcRa0Sws1CB9+HQ=
Received: by mail-qk1-f176.google.com with SMTP id h4so2816941qkm.0;
        Wed, 26 Feb 2020 06:30:09 -0800 (PST)
X-Gm-Message-State: APjAAAVnxsmKLYfK6kHpNmMTtA6LikaK31ybVHrrTy9ybTp8MNsGxrm8
        qICUM2RJNUhyWxM7TsC8MB1xUBai9I8ea1pf0A==
X-Google-Smtp-Source: APXvYqx8P7fHvCOhAoSOWA8DnUwX4yyOHQiABO8b/bbXdZCaWKAxi3z6qQ+ITbxwwNfVk+W8jZLhM9/ZJQIl6x+NuTM=
X-Received: by 2002:a05:620a:12a3:: with SMTP id x3mr2439558qki.254.1582727408199;
 Wed, 26 Feb 2020 06:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20200221053802.70716-1-evanbenn@chromium.org> <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
 <CAL_JsqL94vtBEmV2gNWx-D==sLiRXjxBBFZS8fw1cR6=KjS7XQ@mail.gmail.com> <CAKz_xw2ETZ5eyNfdWU5cF6Qy23E1NqhpFHoLT_CzUDHWTCbw4Q@mail.gmail.com>
In-Reply-To: <CAKz_xw2ETZ5eyNfdWU5cF6Qy23E1NqhpFHoLT_CzUDHWTCbw4Q@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 26 Feb 2020 08:29:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLYpSK6HRT4s=hq153xvU_aiPCq3Hk_oZC-7X7e7daA7Q@mail.gmail.com>
Message-ID: <CAL_JsqLYpSK6HRT4s=hq153xvU_aiPCq3Hk_oZC-7X7e7daA7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173,smc-wdt watchdog
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
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

On Tue, Feb 25, 2020 at 6:15 PM Evan Benn <evanbenn@chromium.org> wrote:
>
> Thanks Rob
>
> > This should be a child of some Mediatek firmware node. I assume
> > watchdog is not the *only* function.
>
> I am not quite sure what you mean, do you intend this:
>
>  firmware {
>    watchdog {

Not quite. /firmware is generic container. I'd expect another layer in
the middle for the overall set of Mediatek firmware behind smc calls.
Look at 'xlnx,zynqmp-firmware' for an example.

Rob
