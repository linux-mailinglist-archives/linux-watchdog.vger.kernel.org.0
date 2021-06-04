Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4E339C12F
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Jun 2021 22:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbhFDUWT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Jun 2021 16:22:19 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:45815 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhFDUWS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Jun 2021 16:22:18 -0400
Received: by mail-oi1-f180.google.com with SMTP id w127so10906961oig.12;
        Fri, 04 Jun 2021 13:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vqiy9aSBN9kmkaSSiG2XuE3toKp+le500QVBi/79kOk=;
        b=cTWo5teMAqKR4HSWZomZ6aZEk+BaIkq7BGHAO2wMnAxccNWFcbTxICK/D/tsVQsCDM
         /4w/8NPXXdfWxmZY5qsPIBZgTIkJbVl2hRDjj0m6I9l09pMlPxt/hZ7ywEGpt0ytJxWo
         QRO1IL+rg6HHmVgu/apS2eLnmzS9Zo3d+pEdH0lT3GJQoz5rtHJbohVhcYCjwgPJG5w+
         9EmZya9o/2NfPncw1EzMYkqf3upO7mrb+o+CDhurWH+Fr8ttwuG+60McvJJQEw0COoE9
         iZe70ZFwmA9J4LFbc9ThXBqcaqLDtHBes4yA4tz8Np4vQUqFuM3+d8ZCZTuw10bJYzYR
         Cpjw==
X-Gm-Message-State: AOAM533I5LguO0gp3wujPTfjUBBL9Oz0DX4D9is5k/6ewjFl/NiALkVT
        x+/ybfJEW+JPn9USYy1ZDg==
X-Google-Smtp-Source: ABdhPJwBsEZlsQpJ0y9Fl/xV8qfI1BtB61L2Tr8mmnoqJurnh6kvzWBpnBorAXAa492IAaoZ5Zzc6Q==
X-Received: by 2002:aca:1205:: with SMTP id 5mr11977091ois.6.1622838022588;
        Fri, 04 Jun 2021 13:20:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v8sm677560oiv.5.2021.06.04.13.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:20:21 -0700 (PDT)
Received: (nullmailer pid 3845891 invoked by uid 1000);
        Fri, 04 Jun 2021 20:20:20 -0000
Date:   Fri, 4 Jun 2021 15:20:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     nicolas.ferre@microchip.com, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: watchdog: sama5d4-wdt: add compatible
 for sama7g5-wdt
Message-ID: <20210604202020.GA3845830@robh.at.kernel.org>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
 <20210527100120.266796-3-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527100120.266796-3-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 27 May 2021 13:01:20 +0300, Eugen Hristev wrote:
> This driver is also compatible with the watchdog on sama7g5 SoC.
> Add the corresponding compatible string to the binding.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
