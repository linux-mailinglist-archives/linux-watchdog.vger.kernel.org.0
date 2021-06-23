Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014823B1733
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 11:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhFWJuo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Jun 2021 05:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFWJun (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Jun 2021 05:50:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616F8C061756
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Jun 2021 02:48:25 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id h15so2975561lfv.12
        for <linux-watchdog@vger.kernel.org>; Wed, 23 Jun 2021 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fKjqUJhszdXpyl10YQ4tIa0Xd7F4iUZDn2xLPlegnEI=;
        b=FE9pvkD16UFCog6pYfw+v3pkk22K4ZVJ0zpA40ZmsTACa8+HUEKertA/5DIJQRH7oZ
         s/mXcY3jEIW+TEtrd4Q/ywwl3JyabAooIGA70VZESqb8GpqY1Dl0WzM2rpBR+iONY1af
         xlfT5kjs6Rz5lX4/gGFffB/Kj9SU8ZuHIo/YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fKjqUJhszdXpyl10YQ4tIa0Xd7F4iUZDn2xLPlegnEI=;
        b=TNmnZX5iCfqut62bNEChhAHw0B5G9dHnz4HYE4sn2SWsv9lpY2miJAWNHymO2pi4ae
         guhM35/GdWNsst1USzih1+doHut+p91v5HTMy652i3SGjQT5+0PF7JJDSP0tXi3J1cII
         gL0EBdltG98+PPALBV+ScTdHiSzPIe1swDNv+3tQtie9VlAQRGd7iyOoMizex5f2KavD
         hzV64mOBusoSmLMCDEGDd8JjwD/1Br9LUIp/TN2nqY7qJX6DRcYnYhyZdf64o3AJVZt9
         ZGCkZJDDIGfI2k/BzWQ7urQJWB5mpa11bM9jqcZ1h58qa5FFgqHk+Hg9SQu0dYLz3FVO
         AFgA==
X-Gm-Message-State: AOAM531s+5j9fonGqQxbsI+VKZ8EltWV8/CdwFaQv8v8NhvOjdC62MFt
        CTxymvw3WG5H6GJN7b2MO8NyksgItGK9n87VSKY5kg==
X-Google-Smtp-Source: ABdhPJwFufLUGkeN2pDvzmj2Ujaq8TRsFGO5abB0KNvd6vttc1EzSYrcmK6EwOHYKsjU7Jyh6LNg/R9FGuatMvavY5U=
X-Received: by 2002:a05:6512:3f13:: with SMTP id y19mr6314168lfa.444.1624441703656;
 Wed, 23 Jun 2021 02:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210623092917.4447-1-Christine.Zhu@mediatek.com> <20210623092917.4447-2-Christine.Zhu@mediatek.com>
In-Reply-To: <20210623092917.4447-2-Christine.Zhu@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 23 Jun 2021 17:48:12 +0800
Message-ID: <CAGXv+5GXfabPk4NV=d8YxQD1UHeqE9M7bgCeG-FT0Ef1n5ECgw@mail.gmail.com>
Subject: Re: [v3,1/3] dt-bindings: mediatek: mt8195: update mtk-wdt document
To:     Christine Zhu <Christine.Zhu@mediatek.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        seiya.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On Wed, Jun 23, 2021 at 5:30 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
>
> From: "christine.zhu" <Christine.Zhu@mediatek.com>
>
> Update mtk-wdt document for MT8195 platform.
>
> Signed-off-by: christine.zhu <Christine.Zhu@mediatek.com>

Please fix your name formatting in your Signed-off-bys and author
for all the patches, and in your overall git setup.

It should read "Christine Zhu", like your sender info on this
email, not "christine.zhu" like an account name.

ChenYu
