Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E95180A33
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Mar 2020 22:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgCJVSy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Mar 2020 17:18:54 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40974 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgCJVSy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Mar 2020 17:18:54 -0400
Received: by mail-ot1-f68.google.com with SMTP id s15so6453819otq.8;
        Tue, 10 Mar 2020 14:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iYG2/A6J0MuYaTBIHQCtF8BBNXHrAqwI6lmzEa8ArSA=;
        b=Yp/my6KeCdY52ZhXYpY83g8ePitOK1UwSGQXybMj6E+wgH7boUx3lQYARGBKRovDTE
         VE9Y+jMHAft2lQ2fd5d6vYZPNQKSyygGQUbr2L347ETAMHC0sBQo3WnOTtl95utolSj9
         cvYWwiMD/2nte0L7HyUIGha7N/qHkQNS/2CS5w5/9Rw0WDzkJ5Tz/Di/8rtfb0MdOcXZ
         a4Ozj68iIZD+4ELtZRmTxCXSFWLsb2hftvPDDMFc8KftRfhrT/Rk36Ud16yMPl6BF9Jq
         knJn3mZ243HPuGUa3XsxGIsPrzJjl+MhVnURsiYBZsW5l+ZHRi0LFt9kc4ya2dF//8nO
         1gTg==
X-Gm-Message-State: ANhLgQ24up3KB+CLRUCz2PLcj5mXEaqQDpqFLGM1vxJMVSQq7HoHfoQv
        gsN/YcMVfnrXRbhGpxbHbg==
X-Google-Smtp-Source: ADFU+vtKlHa3IK/ehZVScFZn40tglX4cN0RpFUVuzT+HjO/JNhCB8Ag3iPcgNLm2zCByIKhaLL9Mng==
X-Received: by 2002:a05:6830:18d4:: with SMTP id v20mr8278772ote.23.1583875131391;
        Tue, 10 Mar 2020 14:18:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b2sm4643842oii.20.2020.03.10.14.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:18:50 -0700 (PDT)
Received: (nullmailer pid 13623 invoked by uid 1000);
        Tue, 10 Mar 2020 21:18:49 -0000
Date:   Tue, 10 Mar 2020 16:18:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net,
        p.paillet@st.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v5] dt-bindings: mfd: Convert stpmic1 bindings to
 json-schema
Message-ID: <20200310211849.GA13562@bogus>
References: <20200304094220.28156-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304094220.28156-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 4 Mar 2020 10:42:20 +0100, Benjamin Gaignard wrote:
> Convert stpmic1 bindings to json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 5:
> - move $ref regulator.yaml under a patternProperties
> - move remain fixed strings under properties field
> 
> version 4:
> - move on uppder node $ref: ../regulator/regulator.yaml 
> - move fixed strings under properties field
> - remove unneeded () in patternProperties
> - keep ldo3 separate from other ldo properties
> Note:
> - 'st,mask-reset' property stay in each subnode, I don't find
>   the syntax to avoid dupliquate it. 
> - ldo6-supply and all possible *-supply are describe by this regular
>   expression: ^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
> 
> version 3:
> - put $ref under allOf keyword
> - for each regulator node add the list of supported regulator properties
> 
>  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 --
>  .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ----
>  .../devicetree/bindings/mfd/st,stpmic1.yaml        | 339 +++++++++++++++++++++
>  .../bindings/regulator/st,stpmic1-regulator.txt    |  64 ----
>  .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 -
>  5 files changed, 339 insertions(+), 164 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
