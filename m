Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD846192DF4
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Mar 2020 17:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgCYQOJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Mar 2020 12:14:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:58152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728132AbgCYQOI (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Mar 2020 12:14:08 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A8A420836;
        Wed, 25 Mar 2020 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585152847;
        bh=wVeCzzQOe5s2fJsmGoK1DwiiQhm+yokBIBkbN7cjDrM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jt+Nhvu8WR2HB5LMtLsy+AMnWzMEv6EzjEMwZuYpiXU2HNY24cKyilbtS7gsEo0Dl
         p9IVkN8+X5tLMau7Si6f2OCiMpQEloPAdwIzCLi8GV2dTWmn9EiLWMRPYI6WaHiQMJ
         UVoXm6rL2REa+wWrMiprolfN7XJt5C+XRUsgMQ0k=
Received: by mail-qk1-f172.google.com with SMTP id c145so3090196qke.12;
        Wed, 25 Mar 2020 09:14:07 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3jHmTjbPypnmDthRX2himDcnnDXq5gl9x9GbZo3fj/ytAyh9yG
        l38cgXpE0LRIPS2cK8RgwvH6TIGejh0rHJy4JQ==
X-Google-Smtp-Source: ADFU+vtZfZlg/qTdAzpY920OXOLDt+yCqLosSPRhFxeYgvrlPS+oV459gEy5edJtvAOkVIBuySDN240c6NQffSPyDT8=
X-Received: by 2002:a37:4a85:: with SMTP id x127mr3744966qka.152.1585152846283;
 Wed, 25 Mar 2020 09:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200304094220.28156-1-benjamin.gaignard@st.com>
 <20200310211849.GA13562@bogus> <20200325092004.GF442973@dell>
In-Reply-To: <20200325092004.GF442973@dell>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 25 Mar 2020 10:13:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLW-5=T0p85M9ZurywdNj_nFwj0VJyxHSJGrdzZGkQcJQ@mail.gmail.com>
Message-ID: <CAL_JsqLW-5=T0p85M9ZurywdNj_nFwj0VJyxHSJGrdzZGkQcJQ@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: mfd: Convert stpmic1 bindings to json-schema
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Mar 25, 2020 at 3:19 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Tue, 10 Mar 2020, Rob Herring wrote:
>
> > On Wed, 4 Mar 2020 10:42:20 +0100, Benjamin Gaignard wrote:
> > > Convert stpmic1 bindings to json-schema.
> > >
> > > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > > ---
> > > version 5:
> > > - move $ref regulator.yaml under a patternProperties
> > > - move remain fixed strings under properties field
> > >
> > > version 4:
> > > - move on uppder node $ref: ../regulator/regulator.yaml
> > > - move fixed strings under properties field
> > > - remove unneeded () in patternProperties
> > > - keep ldo3 separate from other ldo properties
> > > Note:
> > > - 'st,mask-reset' property stay in each subnode, I don't find
> > >   the syntax to avoid dupliquate it.
> > > - ldo6-supply and all possible *-supply are describe by this regular
> > >   expression: ^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
> > >
> > > version 3:
> > > - put $ref under allOf keyword
> > > - for each regulator node add the list of supported regulator properties
> > >
> > >  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 --
> > >  .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ----
> > >  .../devicetree/bindings/mfd/st,stpmic1.yaml        | 339 +++++++++++++++++++++
> > >  .../bindings/regulator/st,stpmic1-regulator.txt    |  64 ----
> > >  .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 -
> > >  5 files changed, 339 insertions(+), 164 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.txt
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
> > >
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Can you take this please Rob?

Yes, done.

Rob
