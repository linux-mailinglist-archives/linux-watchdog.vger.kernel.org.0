Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3923044031B
	for <lists+linux-watchdog@lfdr.de>; Fri, 29 Oct 2021 21:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhJ2T1q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 29 Oct 2021 15:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhJ2T1p (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 29 Oct 2021 15:27:45 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 364E9C061767
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 12:25:16 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id f4so20037721uad.4
        for <linux-watchdog@vger.kernel.org>; Fri, 29 Oct 2021 12:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iOhkeO72w3GegdH+UyM0cQ4je/Oq7dw9gY0y8l00Dps=;
        b=BpYkTOMfIuxl1LvyX+8FrzDYBlDk2ILzW92lnelWdll4LauIavVrbIPnAdsBba0Bay
         9GJPOu/gc7iBsuroJcRmM5lFQTkB4KMxWzntnKzRtuF6APyI1rZYLwj1RWgS2b3AqL28
         W1ZOYWW/N2Ert+OifD7ruHFgHUxPG7dTZIav8RyjyScTzUYcLo9O3a45doCe1j8rvHTM
         4cJz19rDuihHt7YuFsYSwrKnZzIwaThqghVxPcpbJmMU2HXGA+43vMqONmFbciTK/TYL
         GaZsyRWAUFJafjTZ4bOeV8XLUAVo7C+kccYIKaEwihABlZwGP36nNgrQTvIGBKkyl5nc
         gx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iOhkeO72w3GegdH+UyM0cQ4je/Oq7dw9gY0y8l00Dps=;
        b=GVDOhMNK8HcNhnSZwB1YpSZ+BReZTr8SL0GOfEsk9YXSkJX52QzwnZaaJCPatmsH2U
         yDaPYdWMkx2VKquPE8RiuPYZSjg0yDMm65H8bgxlBuyPsDpBN3nfZL65s8jfUcR33p1J
         e6JXDI0lMLtbUwPCi+H/Naropj5DMJqQ3ywJH55wfGtovK77/BER+ySNiWVYLM2xj7dp
         cfaTpuMWH339DmOofDG7HVy/tH/Gb7SSv+Zzj6fmZHp8+8np3wSlc5zePcgOFTfNWF+K
         zG60LVAw6DbUnkMz2EXoWazUI9JVxnVDLsmlap1CojJqEfIkLCmEHJDUxLwiAqJ97izo
         /Hcg==
X-Gm-Message-State: AOAM533wWvW24IllS9deQjIlv5OfFOtKl6lwzMHAVcujxRTZipErrHvT
        Wx+v+xHzGtIllxmu6H0xFz4ZnsVcKTdERFcpwdEceQ==
X-Google-Smtp-Source: ABdhPJxLz+zekne4P7GYaeUWmfz8nQqPqtIf+Pn0XUP0NhGOqQedWV6arFH39XiTpXDM/Najz07v14Z2+6erQK70Hlg=
X-Received: by 2002:a67:f1ca:: with SMTP id v10mr15087571vsm.55.1635535515312;
 Fri, 29 Oct 2021 12:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-4-semen.protsenko@linaro.org> <b9c33def-6b12-1e5a-4449-b1e0869a0e3a@roeck-us.net>
 <2a5ff8d0-c665-e25e-cb40-51326db2e26a@canonical.com>
In-Reply-To: <2a5ff8d0-c665-e25e-cb40-51326db2e26a@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 29 Oct 2021 22:25:03 +0300
Message-ID: <CAPLW+4kd0Woxenf2DUJTRD2zCn9gSg6Wq0Vbt+EjSM5zeTDvHQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] watchdog: s3c2410: Make reset disable optional
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 29 Oct 2021 at 11:04, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 29/10/2021 02:16, Guenter Roeck wrote:
> > On 10/28/21 11:35 AM, Sam Protsenko wrote:
> >> Not all SoCs have AUTOMATIC_WDT_RESET_DISABLE register, examples are
> >> Exynos850 and Exynos9. On such chips reset disable register shouldn't be
> >> accessed. Provide a way to avoid handling that register. This is done by
> >> introducing separate callbacks to driver data structure: one for reset
> >> disable register, and one for mask reset register. Now those callbacks
> >> can be checked and called only when those were set in driver data.
> >>
> >> This commit doesn't bring any functional change to existing devices, but
> >> merely provides an infrastructure for upcoming chips support.
> >>
> >
> > That doesn't explain why the callbacks are needed instead of additional
> > feature flags.
> >
>
> Or why not skipping the disable operations if disable_reg is not provided?
>

Yeah, that was my first thought too :) Then I figured disable_reg is
offset, and 0x0 is a valid offset too. Anyway, I'll rework this patch
using quirks, as discussed above. Will send v2 soon.

>
> Best regards,
> Krzysztof
