Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD0231923E1
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Mar 2020 10:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbgCYJTS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Mar 2020 05:19:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36698 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgCYJTR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Mar 2020 05:19:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so1956929wrs.3
        for <linux-watchdog@vger.kernel.org>; Wed, 25 Mar 2020 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jNQsElt5CknsQbyuzbClTNd1rNuCD5PB0IFY7FEkEZE=;
        b=Zbj6ldZYm/mR4aIkxVyvY0IPEf0i16ypXx5eYF0TkoVSDTejJNAwc128AVd2WXPFvo
         xZ4lSV5Z37VyDD4C0CeoUTKuDVd97oJKvHvnUYhKiNnQf0iMWhCO8Jr2TQgTe8tIOtdM
         6humiowd7FhUMmlsTlfTvB6RKGIWWCqQ7EVNY6qNUHIJZTFtA+WcFM8HGw/gPSmA2DVJ
         zcBaHh6jKvUjRHNl5Rd/1CWV8sZ51VL+znHwfW2zFnzcM0MUB2ME0GFN828xxmA5BQBT
         K9PL+VfT2szihueuddUB3PiYHcUerLFe4r+gqKQW7/X7MJslYafLSu9W/qEWxyA0VQUI
         WbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jNQsElt5CknsQbyuzbClTNd1rNuCD5PB0IFY7FEkEZE=;
        b=KxfMjw8LAkLJC3UdwHw9JWbwTJoOdklswcbe27MULNU0ECWpM/fzli53+XqY/9aqVq
         +14IvM4rlq5fw4Gs/CAfvFpAoMjWvOTQPpvgHbbBsWSMLiaxxPwmqQRT0hEwl1vRubMT
         AFchaVfdXYi5eXj1UT2Svl0I0OZ1WbpImdhTgK9i8I/M4yEp+maQLYuh2SPcAwgSVvSR
         6ZB0V2yHOH10yi9kbcDPNzkppk3579HL5QCgkW1Bpt6kjqnpifL7b7RsFEyy0eBEa6ik
         AWxl6ljtWj1B4Lkt+FozCWlUyRHYo/XZxqMrcDku7XjakSpqUT1ZXJ7M85wkHe5Z5or+
         28CQ==
X-Gm-Message-State: ANhLgQ3WBm0eNmsgUGk3AnptBo4RwK54vtWCgjOS9ie54NmJTwCLNkJz
        yN4YHcf6OJHMbG8eVVxVHZbpoQ==
X-Google-Smtp-Source: ADFU+vt92TEy1uQV/pgVv75Mxe1VsUGqvn6nRZAGARmxAmaHNRKw1/pBPR5pqT6ZOGKIR2rc2xfxew==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr2228715wrw.235.1585127955840;
        Wed, 25 Mar 2020 02:19:15 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id o9sm33495181wrw.20.2020.03.25.02.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 02:19:15 -0700 (PDT)
Date:   Wed, 25 Mar 2020 09:20:04 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net, p.paillet@st.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: mfd: Convert stpmic1 bindings to
 json-schema
Message-ID: <20200325092004.GF442973@dell>
References: <20200304094220.28156-1-benjamin.gaignard@st.com>
 <20200310211849.GA13562@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200310211849.GA13562@bogus>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 10 Mar 2020, Rob Herring wrote:

> On Wed, 4 Mar 2020 10:42:20 +0100, Benjamin Gaignard wrote:
> > Convert stpmic1 bindings to json-schema.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > ---
> > version 5:
> > - move $ref regulator.yaml under a patternProperties
> > - move remain fixed strings under properties field
> > 
> > version 4:
> > - move on uppder node $ref: ../regulator/regulator.yaml 
> > - move fixed strings under properties field
> > - remove unneeded () in patternProperties
> > - keep ldo3 separate from other ldo properties
> > Note:
> > - 'st,mask-reset' property stay in each subnode, I don't find
> >   the syntax to avoid dupliquate it. 
> > - ldo6-supply and all possible *-supply are describe by this regular
> >   expression: ^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
> > 
> > version 3:
> > - put $ref under allOf keyword
> > - for each regulator node add the list of supported regulator properties
> > 
> >  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 --
> >  .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ----
> >  .../devicetree/bindings/mfd/st,stpmic1.yaml        | 339 +++++++++++++++++++++
> >  .../bindings/regulator/st,stpmic1-regulator.txt    |  64 ----
> >  .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 -
> >  5 files changed, 339 insertions(+), 164 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.txt
> >  create mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Can you take this please Rob?

It would save an IB and PR.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
