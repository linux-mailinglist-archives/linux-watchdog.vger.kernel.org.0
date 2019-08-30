Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52884A3C7D
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Aug 2019 18:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbfH3Qsd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Aug 2019 12:48:33 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:32967 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3Qsd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Aug 2019 12:48:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id g2so5009515pfq.0;
        Fri, 30 Aug 2019 09:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NoWyd+lYQBmF9GqrvMJmB3YO9IYLD77A1CH88ORAoIg=;
        b=mTo/FR4fkrBzWT0O3+62g9Qp/hu9V6F1vWpyevQS1U9veZ8PigBugh7Xu1/yiPzzxX
         y9aB+4fBmnT7mM/glcGZtAVaeYan5GUG5/xptUWu12q1Rvw/joHk66SdWEa0lXrRCk+S
         XVJwC1Zr06N2YjnCW+zQGNsE+Qw5srI4SuSk35x1eeNmPHLDZJQGgm+234XBXtDzM1HJ
         WM3KeWm6aQ//qFhLgX2e5x+WAVmwKv8sBhVBZ372c3sx516h4Zt+5It8lgwnS35ZVEsT
         fwVXRVOTpSdG9TjXUJiyPD1u54XnITkFFz7PzM5yCxiOUVhgt6sCEfNGMFOs+ZdBxKQZ
         s7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=NoWyd+lYQBmF9GqrvMJmB3YO9IYLD77A1CH88ORAoIg=;
        b=fCXcdwfLiAB3OSbKfLbrr4A9F6fA8Z2CkEFR3Q7ISVpElom0DByOAgiCcMFgU0kLkc
         EOXfVXf1EuQX6iyyfUTs36nQX3vnEXkTsjkAQs6th80GC14UQ7jAyt7+E4B+uBeKKcmv
         N76j76AFuTyHrMlQsAciirAQV+BUn4L4zEYIzEQrIQyLsZSqz/VPTFQb5pKIDObZR49y
         NISfCGcnM05EtKYSlFNFLnpMnaRiW05hSfChy5TvC7zd39gqUtHJKDlAeFf63Lp7HvmD
         0PIeQ+9mSfj3LqgRBX73zJUSSPw+DKfO8OhImtNWwRPQBa8VuZRCU0CcOuaB8LF7402S
         g83w==
X-Gm-Message-State: APjAAAUsBum9YlhTMzOoLWfyZ+aAia4IlXeIySFp2+wPXIkAzfF/P89c
        gBCYdkPOk6NWGeDstMcHkqU=
X-Google-Smtp-Source: APXvYqxoPmqdngw2RvRJzBNod1E2jSVJcIABHSzC/kOkClI3TWyveYCid6Dk7zA39Rc8F2LTKQAPow==
X-Received: by 2002:aa7:8488:: with SMTP id u8mr19621731pfn.229.1567183712754;
        Fri, 30 Aug 2019 09:48:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14sm6882699pfo.15.2019.08.30.09.48.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Aug 2019 09:48:32 -0700 (PDT)
Date:   Fri, 30 Aug 2019 09:48:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH RESEND v2 3/6] dt-bindings: watchdog: sun4i: Add the
 watchdog interrupts
Message-ID: <20190830164831.GC7911@roeck-us.net>
References: <20190821143835.7294-1-mripard@kernel.org>
 <20190821143835.7294-3-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821143835.7294-3-mripard@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 21, 2019 at 04:38:32PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
> 
> The Allwinner watchdog has an interrupt, either shared or dedicated
> depending on the SoC, that has been described in some DT, but not all of
> them.
> 
> The binding is also completely missing that description. Let's add that
> property to be consistent.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index dc7553f57708..31c95c404619 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -31,9 +31,13 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  interrupts:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> +  - interrupts
>  
>  unevaluatedProperties: false
>  
> @@ -42,6 +46,7 @@ examples:
>      wdt: watchdog@1c20c90 {
>          compatible = "allwinner,sun4i-a10-wdt";
>          reg = <0x01c20c90 0x10>;
> +        interrupts = <24>;
>          timeout-sec = <10>;
>      };
>  
> -- 
> 2.21.0
> 
