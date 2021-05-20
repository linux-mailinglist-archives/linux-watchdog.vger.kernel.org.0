Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BED738B82F
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 May 2021 22:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237192AbhETURJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 May 2021 16:17:09 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:43987 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233159AbhETURI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 May 2021 16:17:08 -0400
Received: by mail-ot1-f45.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso5341673otu.10;
        Thu, 20 May 2021 13:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i0L3Bf9fYCkMYOd16cWvLMKW8YoGjgbbmcyX30LR46E=;
        b=melq6CNlfBuBfdtV4RbqOnne2Ewlgvv708fJYVobBiXxdPUW9ZflDy+0q4GnK19YMl
         AeC9HeLmnBcFM9j7U2/3+GITyiUHaGOWix9rtnsXKVZh/vl6KHcc62LTwdQmQpxvUEnb
         QPU2LVURHTZewYhJSewaTrPrNyOOdaUHHEA3PugfUjGHOGpKjESolT0HtX9M9BwNSyfB
         Y2FusbYVLeImuZgBjDYhtwjV/8KEQZ2WdBuako/SGdIdDhVNGNJcIU/OhVZn8b/b1xYm
         YJ2Xc41Gj0IALmYxxFgrJfBJ9Iqe6yudwBy+gXyLxQQ35F125ORJ8eVQfW9EU3bIR4O0
         OOhA==
X-Gm-Message-State: AOAM531CaEc/nF2EU2ToBX3k/F7tKD+lMSejzSxA2ZWGVd2/rTQgfwoP
        qk0OGsNfc38LDx8FS1s2Aw==
X-Google-Smtp-Source: ABdhPJyCT37DcRLhpyUZKPcqLMZqsqxjO8vGZdLajdstj9rRHXvpUApoWucIG5R3g8BiwdDXCF5t8A==
X-Received: by 2002:a9d:453:: with SMTP id 77mr5471076otc.31.1621541746251;
        Thu, 20 May 2021 13:15:46 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x5sm791111otg.76.2021.05.20.13.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:15:45 -0700 (PDT)
Received: (nullmailer pid 1875910 invoked by uid 1000);
        Thu, 20 May 2021 20:15:44 -0000
Date:   Thu, 20 May 2021 15:15:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: arm,twd: Convert to json-schema
Message-ID: <20210520201544.GA1858494@robh.at.kernel.org>
References: <3ccc0cf5319f56e230ee3b8a009f8d63afb114c1.1621521847.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ccc0cf5319f56e230ee3b8a009f8d63afb114c1.1621521847.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 20, 2021 at 04:45:23PM +0200, Geert Uytterhoeven wrote:
> Convert the ARM Timer-Watchdog Device Tree binding documentation to
> json-schema.  As the old binding document actually contained two
> bindings, it is split in two document: one for the timer part, and one
> for the watchdog part.
> 
> Document missing properties.
> Update examples to match reality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I have listed Marc as the maintainer, as he wrote the original bindings.
> Marc: Please scream if this is inappropriate ;-)

I don't think Marc cares... So I'll put myself.

I've done that and fixed up the node names and applied.

> ---
>  .../bindings/timer/arm,twd-timer.yaml         | 56 +++++++++++++++++++
>  .../devicetree/bindings/timer/arm,twd.txt     | 53 ------------------
>  .../bindings/watchdog/arm,twd-wdt.yaml        | 50 +++++++++++++++++
>  3 files changed, 106 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/arm,twd-timer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/arm,twd.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm,twd-wdt.yaml
