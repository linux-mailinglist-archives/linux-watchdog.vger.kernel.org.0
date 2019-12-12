Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C55A11D7A7
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2019 21:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730749AbfLLUFq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Dec 2019 15:05:46 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41912 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730703AbfLLUFq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Dec 2019 15:05:46 -0500
Received: by mail-ot1-f68.google.com with SMTP id r27so3268157otc.8;
        Thu, 12 Dec 2019 12:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=437EO4ykMGZ70j4wdecX6upxaV7ChyHqB8vxhf7BSCU=;
        b=E8Z+ULO8qgHol6Rsi27z38zqVd4Xbc69LcKOkoFJGjXc3bmNgWG2BjcxceM3WYQcaE
         0KTVJu9KLALvHSqBEHOFect79UpcXnATI2AEuL4PE3CGlT7M5TOp1+Tj7ARIChSG0soK
         52pRTSCXoU7TW26gajeHDZG5GZ515idA3tF6dPKasIPPd/PIrSj6++yhlQzy3OToSOZs
         wkx9d66oFG7yGe3U/Hm4ibJywLk8HSryYKpEXlNm8d2ZWxcvNb3U4FvqZdH8k3L643vY
         hn+LHgt1lFtDNUfQKxkep4qyRWKZXeg7bpRpK2fnx/I6QxfHB7IdgeCEIfGcYOSjBDJQ
         Suag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=437EO4ykMGZ70j4wdecX6upxaV7ChyHqB8vxhf7BSCU=;
        b=Y9J+hHYv0rBDFXI40IWg5QEw9/yFTDg0Hfd+HEP18RxxkZhhuamsQe+20HcwQyWtQ0
         kT83bqK2JAmS832wI9dIYD5nKdpIUrVpGBEQhJ1eVJhbq4GLXZlDL2F2TlUnrdSkKt8W
         Wnk9HqP5u//tMwwQ21qe/gPJyg0Nvy2WxUqHNU6Fm3lSwoaxgPBWZFSH7zRWuhOJAOxV
         I9jTXyhzO4AzS1IUZxCRs4zuzD3Ab328PsWhpFmb8EoMWohMitLgllOpXrt1dyb/TN06
         3/FlbvVMbh0JFj19GPLmxltVS+jrCdVAuITq4sDzzYadIT4MDj42dj+35PH0LNARm4Uy
         EYow==
X-Gm-Message-State: APjAAAWqU+2gVHUO2M8vgpjUND2v0+xMVL606hhT0nHxszIZvtnoWhEr
        acPQh2FCtIU4VEYVIr5msyTyyZ5y55KvqbMOiCg=
X-Google-Smtp-Source: APXvYqzNrNV1NDqP8CepWCfv6Hd8n0AT4q6WjL/e97tNxNuu2sXH1BK40ukL5qB/y5FaxInRXC3FHM5D/HKulk5FNlo=
X-Received: by 2002:a9d:7342:: with SMTP id l2mr10117519otk.98.1576181145181;
 Thu, 12 Dec 2019 12:05:45 -0800 (PST)
MIME-Version: 1.0
References: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com> <1576153187-28378-3-git-send-email-xingyu.chen@amlogic.com>
In-Reply-To: <1576153187-28378-3-git-send-email-xingyu.chen@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 12 Dec 2019 21:05:34 +0100
Message-ID: <CAFBinCBHLqgPExPsVaSWdSOr0Oj-jeYa4Z82U-pJ=fS+D1wGnA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
To:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Xingyu and Rob,

On Thu, Dec 12, 2019 at 1:20 PM Xingyu Chen <xingyu.chen@amlogic.com> wrote:
[...]
> +examples:
> +  - |
> +    watchdog {
> +          compatible = "amlogic,meson-sec-wdt";
> +          timeout-sec = <60>;
> +    };
in v3 of this patch Rob commented that there shouldn't be an OF node
if there are no additional properties
with timeout-sec there's now an additional property so my
understanding is that it's fine to have an OF node

what I don't understand yet is where this node should be placed.
is it supposed to be a child node of the secure monitor node (for
which we already have a binding here:
Documentation/devicetree/bindings/firmware/meson/meson_sm.txt) or
where else would we place it inside the .dts?


Martin


[0] https://patchwork.kernel.org/patch/11211399/
