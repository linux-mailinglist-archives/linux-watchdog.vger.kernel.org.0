Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8DCE910F
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2019 21:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfJ2UwC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Oct 2019 16:52:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbfJ2UwC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Oct 2019 16:52:02 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BE8C21721;
        Tue, 29 Oct 2019 20:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572382320;
        bh=v0+2wjHOV3TPOZBmkD3JlMqMySjlcS3TjLyd/H3+Vb0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jeoJsxjjNE6CGSF/eDsifXtRv6MFoyej58BzCWJ9dtainNbQLHgEBmBOdDbzmlzS3
         8mPLRij1NWGeikAECXh3rin5I3GSDRdDiraYmtN5V48K62fm2+iR+6UYtVtQYbGsuK
         QXNe/3IhAVfAR2fVXlHywPQiAUit8DyD+WOu+YwM=
Received: by mail-qt1-f173.google.com with SMTP id c26so68604qtj.10;
        Tue, 29 Oct 2019 13:52:00 -0700 (PDT)
X-Gm-Message-State: APjAAAW71O0biyQDk6Rxw/SfdSOV27hTey0JxQDJc7B49U1pyJVgrEju
        XlaCfBvYqeH1IyUYEmoHxFzHkkJrYTJ8wboW/w==
X-Google-Smtp-Source: APXvYqyeg1I39tq2DqoXkraIzTHFUcqmrXNzXXgnb3VS9R2ReFwbWaEL1h/jcRIEbWALZ20wYKpj3bIc8bfKSrVHldc=
X-Received: by 2002:ac8:65d5:: with SMTP id t21mr1315081qto.300.1572382319631;
 Tue, 29 Oct 2019 13:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <1571983984-11771-1-git-send-email-xingyu.chen@amlogic.com>
 <1571983984-11771-3-git-send-email-xingyu.chen@amlogic.com>
 <20191025203030.GA28391@bogus> <1914e315-3cb7-9251-f871-0024e0e4f68b@amlogic.com>
In-Reply-To: <1914e315-3cb7-9251-f871-0024e0e4f68b@amlogic.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 29 Oct 2019 15:51:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLr-Cgu4yZFGTfO=qpFPLBZ1gb-1+DZ35eQX3dUsadm4g@mail.gmail.com>
Message-ID: <CAL_JsqLr-Cgu4yZFGTfO=qpFPLBZ1gb-1+DZ35eQX3dUsadm4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
To:     Xingyu Chen <xingyu.chen@amlogic.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Oct 28, 2019 at 3:35 AM Xingyu Chen <xingyu.chen@amlogic.com> wrote=
:
>
> Hi, Rob
>
> On 2019/10/26 4:30, Rob Herring wrote:
> > On Fri, Oct 25, 2019 at 02:13:02PM +0800, Xingyu Chen wrote:
> >> The binding targets the Meson-A/C series compatible SoCs, in which the
> >> watchdog registers are in secure world.
> >>
> >> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> >> ---
> >>   .../bindings/watchdog/amlogic,meson-sec-wdt.yaml   | 34 ++++++++++++=
++++++++++
> >>   1 file changed, 34 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/watchdog/amlogi=
c,meson-sec-wdt.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-=
sec-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec=
-wdt.yaml
> >> new file mode 100644
> >> index 00000000..0bbc807
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt=
.yaml
> >> @@ -0,0 +1,34 @@
> >> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >> +# Copyright (c) 2019 Amlogic, Inc
> >> +%YAML 1.2
> >> +---
> >> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-wdt.yaml#=
"
> >> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >> +
> >> +title: Amlogic Meson Secure Watchdog Timer
> >> +
> >> +maintainers:
> >> +  - Xingyu Chen <xingyu.chen@amlogic.com>
> >> +
> >> +description: |+
> >> +  Secure Watchdog Timer used in Meson-A/C series Compatible SoCs
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - amlogic,meson-sec-wdt
> >
> > If there are no other properties, then you don't need this. Just have
> > the secure firmware driver instantiate the watchdog.
> I'am very sorry i don't understand how to initialize the watchdog driver
> if the compatible property is removed, Could you give me more
> suggestions or examples =EF=BC=9F Thank you very much.

platform_device_register_simple() from the secure firmware driver.

Rob
