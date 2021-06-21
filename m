Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D513AE301
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Jun 2021 08:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbhFUGOM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 21 Jun 2021 02:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhFUGOM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 21 Jun 2021 02:14:12 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09ACC06175F
        for <linux-watchdog@vger.kernel.org>; Sun, 20 Jun 2021 23:11:57 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id s19so7515080ilj.1
        for <linux-watchdog@vger.kernel.org>; Sun, 20 Jun 2021 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dFqcjBkyeVbZVV81wdO/BU0CaNfO5X/9PBfKgEeRgeo=;
        b=WjN0ZfJouIM92ExeXVN/VfvHeYcui9sJMlsZgf7lusL7S4EQxITNUOTsLH5uA7wcCd
         sd9HxvUQEptKg87qlalK3+ECk9KIpBGUueOJphaKYCTcY+zaDxCRt5/EFP2aeiXUE4mp
         WAbKqn1i6UvyfZK8ZbplzZF425eacqmBWN4kxvcNc36b4+piHL9VMVV/7sEZiKiVXHcL
         LWQeNuRua71aYtIUoCjBZ0XLEjxj2L1KBh4riLZuBawH7AYONHm4L4nCGqucnGtPv+eF
         vrcPVPsWJTmgS48Ktr7qVB/f6U+94aoO7Rgu4yW0drPPCVsfANfhxpR3PUKiZBxhRRyf
         4hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dFqcjBkyeVbZVV81wdO/BU0CaNfO5X/9PBfKgEeRgeo=;
        b=NbcVASwh8QHKhwE5OkySRrqCwaPUUPqU+SYPt1EDioHssqHwaJBdgjUyW+6kh6/M0j
         WBjoUDrdlk+AU/QdH1fahrVpHEGMYWIuVWGDFLTS8tEWej1VLNN8K0BsGDMp5Va9k6Ej
         ioxIwrgodZk34QhjjLamSACF3z1TQ68KmO1y5ygMJ29DWBZIS6KS22v2pPT3CxfHHocf
         xPNpemqKCG28wuqoexBkLtQs3r2IjFfT0O2sgFA/VPICBPaWEuLV92YWDHwrZKJxblCH
         f0GVWgsuAN4nAjFRr/majT/2xRd0ScDxCnGBci3SQ29ka+ROlaQjvBb4MSZwwUoCm9Jd
         GQ1g==
X-Gm-Message-State: AOAM532zWnbFwbFEZYd8Rwa4yi7tu099PS88kPoVSMfu549Z7Twe5zxH
        2ffq5aRiBlYamNVDzYiTimax0R+2b0pbZE0lXCwHEw==
X-Google-Smtp-Source: ABdhPJyXrNphIWVha3+XvhL1Wr4g/Hu/IsLOdxATEkfyUq93ra89qOiGrsa3KzRhW7mYzOPs9o+vEAQLm/voaAEOIIo=
X-Received: by 2002:a05:6e02:13e4:: with SMTP id w4mr12312587ilj.127.1624255917176;
 Sun, 20 Jun 2021 23:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210620134954.15233-1-Christine.Zhu@mediatek.com> <20210620134954.15233-3-Christine.Zhu@mediatek.com>
In-Reply-To: <20210620134954.15233-3-Christine.Zhu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 21 Jun 2021 14:11:46 +0800
Message-ID: <CA+Px+wVTAbU37tEtGWmLGPaMSJkrQXOUyMRzY==rQQ5E7=m6+g@mail.gmail.com>
Subject: Re: [v1,2/3] dt-binding: mt8195: add toprgu reset-controller head file
To:     Christine Zhu <christine.zhu@mediatek.com>
Cc:     linux@roeck-us.net, robh+dt@kernel.org, wim@linux-watchdog.org,
        matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        seiya.wang@mediatek.com, linux-watchdog@vger.kernel.org,
        rex-bc.chen@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Jun 20, 2021 at 9:50 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> add toprgu reset-controller head file for MT8195 platform
Please write complete sentences.

> Change-Id: Ib08da609e87d31ff0aa06b066f9797070931a693
Remove the unneeded tag.

> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
Maybe 2021?

The patch needs other proper prefixes.  For example, "dt-bindings:
reset: mt8195".
