Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDDC18DB6A
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Mar 2020 23:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgCTW7i (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 Mar 2020 18:59:38 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:45594 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgCTW7i (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 Mar 2020 18:59:38 -0400
Received: by mail-io1-f65.google.com with SMTP id e20so7329608ios.12;
        Fri, 20 Mar 2020 15:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=K0axjDMp36VyjNAAPGeG7/hvUjPs1+TievtjaHeg57o=;
        b=HLwFm2xK9PYedPl7zqrWvH8TK5Lve3PtRcn/sWRRhgVA/7/vpPZ4Ov2sArwI+iledd
         tuvU6rORoi7mDzdlnevJABEENHoJPlckJzoEA6964RLRbT25TP3ipAZJwYxQs6hU2IlH
         n6Jf6AdejxaVcnW35K60po6rL2xLPS4B3M7m3CwH+//J/qo+ccOeGvTcTu97lZ/n3bh7
         pL8SV1t8xeuooOZA3KISgKpGLJj9YQDRpBvo6VRfGwbVaMJ9u0XvjOiqcVunTDnfdmUf
         2vmttX4/6vWrsa9oZTryuekLGLXqfxAQJUXXPZHOAF6GYa5CTnL+BHVSM4BeBAZCldOF
         S2WA==
X-Gm-Message-State: ANhLgQ3nYovJEt3IAmcGDLJrZ12Qb3mVmUxgk88qHIuaJhR0dQRJ8owe
        ht6yXjJ2hzl788fEVS0VzLg4ey0=
X-Google-Smtp-Source: ADFU+vte9X9NZhjsczqaPdSbfAHNS7ZR5R0LfSZIHIheXO7aq/st2W+E7btD/FH02K90t9/k4f/lUw==
X-Received: by 2002:a6b:9386:: with SMTP id v128mr9824442iod.15.1584745177358;
        Fri, 20 Mar 2020 15:59:37 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k16sm2488955ilc.6.2020.03.20.15.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 15:59:36 -0700 (PDT)
Received: (nullmailer pid 30110 invoked by uid 1000);
        Fri, 20 Mar 2020 22:59:35 -0000
Date:   Fri, 20 Mar 2020 16:59:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCHv4 1/4] dt-bindings: watchdog: Add support for TI K3 RTI
 watchdog
Message-ID: <20200320225935.GA30036@bogus>
References: <20200312095808.19907-1-t-kristo@ti.com>
 <20200312095808.19907-2-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312095808.19907-2-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 12 Mar 2020 11:58:05 +0200, Tero Kristo wrote:
> TI K3 SoCs contain an RTI (Real Time Interrupt) module which can be
> used to implement a windowed watchdog functionality. Windowed watchdog
> will generate an error if it is petted outside the time window, either
> too early or too late.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v4:
>   * changed license to dual
>   * added documentation for missing properties
>   * added ref to watchdog.yaml
>   * renamed main_rti0 to watchdog0 in example
> 
>  .../bindings/watchdog/ti,rti-wdt.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
