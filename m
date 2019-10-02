Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFAAC8B41
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Oct 2019 16:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbfJBOaM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Oct 2019 10:30:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:43204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726374AbfJBOaM (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Oct 2019 10:30:12 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FE6921D80;
        Wed,  2 Oct 2019 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570026611;
        bh=WpPgCl+g9ZzL3G0BUaPixm3EVaJp8snYP/4w+OBoehk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Dm6RTYpnTIi0ZDVTW1+XMKlWKlmuCwHWjnYOgGZKR8gw5JbFnw5kuSx7QZpIiUOoA
         DYWM/HcFpQ80aAQLXBS7byICx0hczfGe3du+Q6Eb/XOwo7YilaxldE3yV3xiOfr5rb
         G4f/OKmomTo/JL0fIbcKc80/1ZMi+urdsO+DA4Ls=
Received: by mail-qk1-f169.google.com with SMTP id q203so15212224qke.1;
        Wed, 02 Oct 2019 07:30:11 -0700 (PDT)
X-Gm-Message-State: APjAAAVW1mRLYXMeR7w3IBrfmN6zIrI/LEb0IWTXg7NoaGsaDXTURdvC
        0v2GKe50URSMrIeCYZ9nOJwPsHmaGK5bsWk50g==
X-Google-Smtp-Source: APXvYqzdn9uUBorveNlH9/zku6XeiHfTcpcd3PnD7qfkjK0RFzES53PVyzXJzDlm8TCLXVM/5BlhuUiICj6nXK85HCg=
X-Received: by 2002:a05:620a:549:: with SMTP id o9mr4051798qko.223.1570026610271;
 Wed, 02 Oct 2019 07:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190920162124.7036-1-krzk@kernel.org> <20191001222109.GA26050@bogus>
 <20191002074828.GA6221@pi3>
In-Reply-To: <20191002074828.GA6221@pi3>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 2 Oct 2019 09:29:56 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+KG-7G-VF_hjgugvAP+CrNb+fxy1yca6SC6G3M_WGYiQ@mail.gmail.com>
Message-ID: <CAL_Jsq+KG-7G-VF_hjgugvAP+CrNb+fxy1yca6SC6G3M_WGYiQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 2, 2019 at 2:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Oct 01, 2019 at 05:21:09PM -0500, Rob Herring wrote:
> > On Fri, Sep 20, 2019 at 06:21:22PM +0200, Krzysztof Kozlowski wrote:
> > > Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> > > using json-schema.
> > >
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v1:
> > > 1. Indent example with four spaces (more readable),
> > > 2. Remove unneeded timeout-sec description and include generic bindings.
> > > ---
> > >  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
> > >  .../bindings/watchdog/samsung-wdt.yaml        | 65 +++++++++++++++++++
> > >  2 files changed, 65 insertions(+), 35 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> > >  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
>
> Hi Rob,
>
> The generic watchdog YAML/DT schema is already in v5.4-rc1 so this can
> go either trough you, or through watchdog tree.

Okay, I've applied the series.

Rob
