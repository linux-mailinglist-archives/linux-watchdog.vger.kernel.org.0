Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE61339C12B
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Jun 2021 22:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhFDUWC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Jun 2021 16:22:02 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:36847 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhFDUWB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Jun 2021 16:22:01 -0400
Received: by mail-ot1-f49.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so10290879otl.3;
        Fri, 04 Jun 2021 13:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0avzuQnNR7HZ+mM+A+Ms8sNwoVcntrqmBHLGzafpqm0=;
        b=JX6qO2MRfHtuajNa82RaLfRVVWtdpNglFP5fPOtDzCWKJ6fVLx6MErYrGzMdDmVCic
         lSyAZewn+DaaUSzPKuZ+IuSoCl9fDweHiumPCqs/ydZbfWKKqkVydZsqBukWTu/3T2yV
         aFIChQKKxecfcVmNdKy2sKxtFLVECa+2yIaY75AkcbRKNtfpgf+kAAX84M/R/owLaR66
         ZrvWrD6NPletpBxB2hrJrECq1aI3bZD6tAVFvrwKoxjmYTyhd2v4cuWSZgkWx1eoCCet
         1owFWqn0IUTG+dID6qxjsEeqWlbOzMPDUxDV2emier0BZNKJSYkU4p5jH55GF0N4jVCq
         ySDQ==
X-Gm-Message-State: AOAM533AR/Fl7wpt22i7rdwSYeuOdClqDsvMIyug1xqOlm808BgC2jHY
        yCVbqmAYOURugySxiFnu5g==
X-Google-Smtp-Source: ABdhPJwCay4DZi6JAAoGHJuQV7PMghNuxRxVFhtgtuUD5JmZCBxOZZ+NNUSsgu+Ek8wQ996g8rtq1Q==
X-Received: by 2002:a05:6830:124a:: with SMTP id s10mr5076018otp.300.1622838014541;
        Fri, 04 Jun 2021 13:20:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k14sm641572ooi.21.2021.06.04.13.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:20:13 -0700 (PDT)
Received: (nullmailer pid 3845575 invoked by uid 1000);
        Fri, 04 Jun 2021 20:20:12 -0000
Date:   Fri, 4 Jun 2021 15:20:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     devicetree@vger.kernel.org, linux@roeck-us.net, robh+dt@kernel.org,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        nicolas.ferre@microchip.com
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: sama5d4-wdt: convert to yaml
Message-ID: <20210604202012.GA3845510@robh.at.kernel.org>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527100120.266796-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 27 May 2021 13:01:18 +0300, Eugen Hristev wrote:
> Convert the old txt binding to yaml format.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  .../bindings/watchdog/atmel,sama5d4-wdt.yaml  | 73 +++++++++++++++++++
>  .../bindings/watchdog/atmel-sama5d4-wdt.txt   | 34 ---------
>  2 files changed, 73 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
