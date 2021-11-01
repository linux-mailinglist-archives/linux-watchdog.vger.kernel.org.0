Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A97E442053
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Nov 2021 19:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbhKASzK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 1 Nov 2021 14:55:10 -0400
Received: from mail-oo1-f54.google.com ([209.85.161.54]:37418 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhKASzK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 1 Nov 2021 14:55:10 -0400
Received: by mail-oo1-f54.google.com with SMTP id j6-20020a4aab46000000b002bb88bfb594so3958170oon.4;
        Mon, 01 Nov 2021 11:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ez0ExjaNOgPztd9ik8mcUgxIwkY6xjgLzAofxYvSIf0=;
        b=lZ3Qmmp3JtejhNAz8hcLMBNXyZKTBtm9QhclHA8ju5r+TttQAbfRr+pqtTZ9L99wJi
         JAl/DwLwV/i1QvwRsZ7tOoRR8fua3Hzyvj212UlFhwH8Ffuhg2qotQbuS5cSZrfSyvcx
         UAI4vgMvwWDK5Pam3wD1q9+oWBeG77BvtO1SmQDJDIGLORROVRlibtlyykLNKDtWee79
         P9m6mwcUU7td+6MlUOYtN/s71FYN1kbkDbA7cpCdgUMb1+lzNTcYrKPwMKMrzZ02sqcw
         EgV4NYgDtUraMUQO+MQ1Jj/qFKUIv4F9ZUCTlcm7HRjPRzv0FWFWUBRkdQmW91zOy9og
         eIzA==
X-Gm-Message-State: AOAM531c4FIE6fC8q1qV0zWjCS827dlA6kxS187z76e2PTfgp1j/ch6r
        DSllG92cda00WricyVB2Ag==
X-Google-Smtp-Source: ABdhPJxtoXJxZs7lFaY7FEDIKbY6oPUmYGlccuoUr1jfHm2e1MPRxljcAxM8pevk4tFiQE5bW3btvA==
X-Received: by 2002:a4a:e681:: with SMTP id u1mr10019234oot.75.1635792756553;
        Mon, 01 Nov 2021 11:52:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s23sm4364436oie.20.2021.11.01.11.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 11:52:35 -0700 (PDT)
Received: (nullmailer pid 819012 invoked by uid 1000);
        Mon, 01 Nov 2021 18:52:34 -0000
Date:   Mon, 1 Nov 2021 13:52:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Maxime Ripard <mripard@kernel.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, ~okias/devicetree@lists.sr.ht
Subject: Re: [PATCH] dt-bindings: watchdog: sunxi: fix error in schema
Message-ID: <YYA3cqxn7k6p8Iti@robh.at.kernel.org>
References: <20211029142443.68779-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029142443.68779-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 29 Oct 2021 16:24:42 +0200, David Heidelberg wrote:
> "maxItems" is not needed with an "items" list
> 
> Fixes:
> $ DT_SCHEMA_FILES=Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml make dtbs_check
> Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml: properties:clocks: {'required': ['maxItems']} is not allowed for {'minItems': 1, 'maxItems': 2, 'items': [{'description': 'High-frequency oscillator input, divided internally'}, {'description': 'Low-frequency oscillator input, only found on some variants'}]}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> ...
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 --
>  1 file changed, 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
