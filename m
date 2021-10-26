Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AFE43BB7F
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Oct 2021 22:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235431AbhJZUXF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Oct 2021 16:23:05 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:33476 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhJZUXF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Oct 2021 16:23:05 -0400
Received: by mail-ot1-f42.google.com with SMTP id 107-20020a9d0a74000000b00553bfb53348so462885otg.0;
        Tue, 26 Oct 2021 13:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4FPCbL/IXG0U83mA61F/fjN95dvabIWhtHG3sE9QWVs=;
        b=43umcqOhVPTLHSecWSoRhPSWU+nqvVL89ikTcB/ssaxg+cgI4bmL2pDq91bFR+refz
         W3g5MTtzCXUrpgaUaLYIcIJyfi8zxgX+aeKQIzZAJMIZ6GCNPltlCJfBxVZa7o9cjpoj
         SlVg1yWlW3CpNMiF7HO9Np0C1mbUxZLCrLOtr7Lqpx6qxanDbw7nwxpPmMELdV3et5ix
         Mh9Fao95rZNjv8Ql6j0TL2GUnipMFmn4QZbP3Qaut/fD7EOIJcPDlvTWdv5oANJ5nfkx
         j4BsujXl8NPDaZI/moE0dWusi5GBrCnDA5+uM2TYPCHRy1zv5XJH2u02GTpbIIk57EKW
         A40w==
X-Gm-Message-State: AOAM531BVdEsoOxutlSuPgtbTkIqhTgmtEOuMCSfA0VxxT9RfK3HLgZm
        TG1/LqeicvaUj+TZuBp/kQ==
X-Google-Smtp-Source: ABdhPJwo5mtTZQxay3pzWYhe9ieTVr1Fe9Hqae9mQdyEE81hsAYJv4foKYAPDOEMz6rH6D1mmTQgQQ==
X-Received: by 2002:a9d:6d0b:: with SMTP id o11mr21260128otp.372.1635279640475;
        Tue, 26 Oct 2021 13:20:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x9sm627810oie.7.2021.10.26.13.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 13:20:39 -0700 (PDT)
Received: (nullmailer pid 3172750 invoked by uid 1000);
        Tue, 26 Oct 2021 20:20:38 -0000
Date:   Tue, 26 Oct 2021 15:20:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Realtek Otto WDT binding
Message-ID: <YXhjFpV5jKk1lFU9@robh.at.kernel.org>
References: <cover.1634131707.git.sander@svanheule.net>
 <c00b96185441462557cf2c12db96300f18744353.1634131707.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c00b96185441462557cf2c12db96300f18744353.1634131707.git.sander@svanheule.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 13 Oct 2021 15:28:59 +0200, Sander Vanheule wrote:
> Add a binding description for Realtek's watchdog timer as found on
> several of their MIPS-based SoCs (codenamed Otto), such as the RTL838x
> and RTL839x series of switch SoCs.
> 
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  .../bindings/watchdog/realtek,otto-wdt.yaml   | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
