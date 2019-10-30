Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F09CE9C81
	for <lists+linux-watchdog@lfdr.de>; Wed, 30 Oct 2019 14:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbfJ3Nlk (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 30 Oct 2019 09:41:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:42302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726455AbfJ3Nlk (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 30 Oct 2019 09:41:40 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB06621835;
        Wed, 30 Oct 2019 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572442898;
        bh=gtW9lBCHYSFLzLt+Y4vmNjY6RQBl1PYhNCIRW411fKc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qCzNF72OeP2yuN1QKyh6EUkCPtUFmV81uFCIM7opTvJ32zih6iZmaGaUNtB/Y/Uud
         WjtXNnKa1N4TR7U3GasW9G0wvuSWnYkB5Z8ne+R1sX1ofja5IEEaPigV4fQEQ5nHGo
         p+2o3pZYQRi/+siGUEPmVKcIL7jZMxxSCuGOj2tc=
Received: by mail-qt1-f176.google.com with SMTP id o3so3230243qtj.8;
        Wed, 30 Oct 2019 06:41:38 -0700 (PDT)
X-Gm-Message-State: APjAAAVeEnD19xkYHlGLMz5HrTVhyXAok7PR+TWXqv2eu2kubuQrgCQJ
        1ezrBgFUN6YzqaQUkZzAI5MwSlHKEUmITOB9gw==
X-Google-Smtp-Source: APXvYqyJeRtrj4NZxrAmhQbZidXzHwq5bToWSyEa3h/U5Q+Iht3Q5hsqUkNeSn9TlIsy2IbzfHVQdj+AQkyb4d9plRc=
X-Received: by 2002:ac8:4791:: with SMTP id k17mr80313qtq.136.1572442897886;
 Wed, 30 Oct 2019 06:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <1571983984-11771-1-git-send-email-xingyu.chen@amlogic.com>
 <1571983984-11771-3-git-send-email-xingyu.chen@amlogic.com>
 <20191025203030.GA28391@bogus> <1914e315-3cb7-9251-f871-0024e0e4f68b@amlogic.com>
 <CAL_JsqLr-Cgu4yZFGTfO=qpFPLBZ1gb-1+DZ35eQX3dUsadm4g@mail.gmail.com> <2808a8c9-a835-2706-f300-0deb924d3686@amlogic.com>
In-Reply-To: <2808a8c9-a835-2706-f300-0deb924d3686@amlogic.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 30 Oct 2019 08:41:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKwmF1Ygbjiteq42t5xaG75vG-=hZYq=S-8e=s0m2FiWA@mail.gmail.com>
Message-ID: <CAL_JsqKwmF1Ygbjiteq42t5xaG75vG-=hZYq=S-8e=s0m2FiWA@mail.gmail.com>
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

On Wed, Oct 30, 2019 at 7:59 AM Xingyu Chen <xingyu.chen@amlogic.com> wrote=
:
>
> Hi,Rob
>
> On 2019/10/30 4:51, Rob Herring wrote:
> > On Mon, Oct 28, 2019 at 3:35 AM Xingyu Chen <xingyu.chen@amlogic.com> w=
rote:
> >>
> >> Hi, Rob
> >>
> >> On 2019/10/26 4:30, Rob Herring wrote:
> >>> On Fri, Oct 25, 2019 at 02:13:02PM +0800, Xingyu Chen wrote:
> >>>> The binding targets the Meson-A/C series compatible SoCs, in which t=
he
> >>>> watchdog registers are in secure world.
> >>>>
> >>>> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> >>>> ---
> >>>>    .../bindings/watchdog/amlogic,meson-sec-wdt.yaml   | 34 +++++++++=
+++++++++++++
> >>>>    1 file changed, 34 insertions(+)
> >>>>    create mode 100644 Documentation/devicetree/bindings/watchdog/aml=
ogic,meson-sec-wdt.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meso=
n-sec-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-s=
ec-wdt.yaml
> >>>> new file mode 100644
> >>>> index 00000000..0bbc807
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-w=
dt.yaml
> >>>> @@ -0,0 +1,34 @@
> >>>> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >>>> +# Copyright (c) 2019 Amlogic, Inc
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-wdt.yam=
l#"
> >>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> >>>> +
> >>>> +title: Amlogic Meson Secure Watchdog Timer
> >>>> +
> >>>> +maintainers:
> >>>> +  - Xingyu Chen <xingyu.chen@amlogic.com>
> >>>> +
> >>>> +description: |+
> >>>> +  Secure Watchdog Timer used in Meson-A/C series Compatible SoCs
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    enum:
> >>>> +      - amlogic,meson-sec-wdt
> >>>
> >>> If there are no other properties, then you don't need this. Just have
> >>> the secure firmware driver instantiate the watchdog.
> >> I'am very sorry i don't understand how to initialize the watchdog driv=
er
> >> if the compatible property is removed, Could you give me more
> >> suggestions or examples =EF=BC=9F Thank you very much.
> >
> > platform_device_register_simple() from the secure firmware driver.
> Thanks for your help. The device node of wdt looks useless if I use this
> function to register device. if so, how should I get the pointer to
> secure-monitor in wdt driver ? or should I use directly arm_smccc to
> access the secfw ?

You can use of_find_compatible_node(). There should only be one firmware no=
de.

Rob
