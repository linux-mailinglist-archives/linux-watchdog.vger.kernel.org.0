Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14FD1EC59C
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jun 2020 01:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgFBXWr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 2 Jun 2020 19:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbgFBXWp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 2 Jun 2020 19:22:45 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66340C08C5C0
        for <linux-watchdog@vger.kernel.org>; Tue,  2 Jun 2020 16:22:44 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id d22so10782vkf.12
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Jun 2020 16:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rui6nfEXkR9RNeNeTRrsaME99AQHMk8K/AUIJ5I/AMI=;
        b=mgvbJhQRav73RcCysfGBhLfjII+KzTEIxOz5wXi5BzuaVgVxxYssljthV0APDBLs6m
         CwORb6IW9136cyU59Jxtnyhi3QGu0gv5oIuQ/Uyi0UQvVyMn065B93SdLGu8BzalAOhv
         rXRLgD6nB8CDNniy7aeJauFOEhHjz8j8gim2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rui6nfEXkR9RNeNeTRrsaME99AQHMk8K/AUIJ5I/AMI=;
        b=eeORd5owN/hulmmDVn3tnERfkRL+oFtqEDqFK+5MTEcfD2mpQ+GLj6txl4llLgSO1j
         GJw/Ae/GtvMLim3cogDgdcNHvfbBNNWX7KEOWCRV1P/M8dR2nPr3v3Tlv6R39NOL2OQO
         sn4Suf8jtE00/03g7/isF/WTV00GwliIsk8S1/UR7sRbFq9EOWamY/s2Nk52Z92aAXVH
         Fo7Jf7rQRhObuivCdNwYcW2NiwGyCkSQNPApQv7B8dnUS40fMGvHyjz9h8HQbxj5e0Uu
         oywzqVQqVDmlMUbqkJoHj0AEwXDli3AMWcCUoC5B8IN1tjRYFlmp+jhk0oO2eEff7sgk
         noeQ==
X-Gm-Message-State: AOAM531C4a0hQ+bkT2Gg7f8doyVz9SATqrNhuA5JOrao8ZzZsA+3ETAV
        fI2lBGFjtbahq11OIXr6Slf6DUKd5mI=
X-Google-Smtp-Source: ABdhPJzk0X4kv+QMVFF5x9QOglad0m9yMyXT5R8efwAT2VykdzTFalBGH5DfCB9Xrt6PZhJspTAewQ==
X-Received: by 2002:a1f:2f51:: with SMTP id v78mr6732978vkv.52.1591140163307;
        Tue, 02 Jun 2020 16:22:43 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id d2sm43402vsp.4.2020.06.02.16.22.42
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 16:22:42 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id m23so21179vko.2
        for <linux-watchdog@vger.kernel.org>; Tue, 02 Jun 2020 16:22:42 -0700 (PDT)
X-Received: by 2002:ac5:c54e:: with SMTP id d14mr204225vkl.30.1591140161937;
 Tue, 02 Jun 2020 16:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
 <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net> <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
In-Reply-To: <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
From:   Evan Benn <evanbenn@chromium.org>
Date:   Wed, 3 Jun 2020 09:22:16 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
Message-ID: <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
To:     Julius Werner <jwerner@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Apologies for that slip up.

Reviewed-by: Evan Benn <evanbenn@chromium.org>

On Wed, Jun 3, 2020 at 6:16 AM Julius Werner <jwerner@chromium.org> wrote:
>
> Reviewed-by: Julius Werner <jwerner@chromium.org>
