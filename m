Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80055489D8
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 Jun 2019 19:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfFQRRf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 Jun 2019 13:17:35 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44479 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfFQRRe (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 Jun 2019 13:17:34 -0400
Received: by mail-pl1-f194.google.com with SMTP id t7so4339431plr.11;
        Mon, 17 Jun 2019 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MfbRHst16AuRrONhOcPfkNKHkukWQnEsmkrhJDSukAg=;
        b=ulvmKH/Ju8SfbAVduOinGthQyf7R1nunpPaey9GIgtn38PX2rfEGhXRIo0OnMswZG2
         VgmtBAm+yh8sbbelDhY88OyC8R+YtRCAxCBp3n9Uih4r0RsBiUGQvimfWuwfHtrsaq0i
         zDV9K6u+07nx33hT8AK6y1N9fJhwNxZk8HLScZvwOpIEeic9zOUOKVZCPt53l63SE4Wn
         PAXmaRLDfXhYk4prT9KNuSWQdHMRKmx5TLAyy2ce2gLV9QxGsU4NyutBFZCGO/cUoRQ6
         7nzkAX4y1SGEPffZ1/pbW4U5kVtw6Zi/id53dxMNauVkJlui+XspKBJNDl7j6emwf5/b
         9acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MfbRHst16AuRrONhOcPfkNKHkukWQnEsmkrhJDSukAg=;
        b=ZJb2wnjgH/6bimCgocjPdPNSMG8UY8E5i75RGYzh3KOlBt9IS5TFA8KszN/nYk+kbm
         bI0+i9rUCa9Ed1A2ZPbMnijJlYxpzeCGSsRRzf8tpAVfqNc9d8/Urd42+DJlF2CsuzT+
         TtTxL8BFBPqf9cwZOrbQrPoukV0VhXKvTxu5vjPq9KxT0oQUi0XkO2dvwwZYoCtKPmh+
         TzIzR230KqXOspc2ylEhfVMO3vmEbtAJ7Mt5AqdVLplvNNF9cCLkWaoCzILPoQuXeHrR
         jZIzrwj+FYi54jTfkqTnYEtBixnTHStfkqfdrnRYLLZL94UsVbA9zxOxYnS9Yat9gzYY
         7S+g==
X-Gm-Message-State: APjAAAUsbPLJnl+Opa6as6J8h9cQqCG3gR9jDwEmngg2HrG0gP9h/5lO
        6ngeHskVpIxMfFte7G7XrgI=
X-Google-Smtp-Source: APXvYqw4Ix7wxKE9E0iy6CWwDHfI59N9/BZUPm9S2eGlqyRfLPBlE7Ygl9sF7OTDXAq+cCbGrNoVaQ==
X-Received: by 2002:a17:902:ba8b:: with SMTP id k11mr7400665pls.107.1560791851987;
        Mon, 17 Jun 2019 10:17:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i3sm12795393pfo.138.2019.06.17.10.17.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 10:17:30 -0700 (PDT)
Date:   Mon, 17 Jun 2019 10:17:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: watchdog: Rename bindings documentation file
Message-ID: <20190617171729.GA13807@roeck-us.net>
References: <20190617090953.8770-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617090953.8770-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jun 17, 2019 at 11:09:53AM +0200, Simon Horman wrote:
> For consistency with the naming of (most) other documentation files for DT
> bindings for Renesas IP blocks rename the Renesas WDT documentation file
> from renesas-wdt.txt to renesas,wdt.txt.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/{renesas-wdt.txt => renesas,wdt.txt}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/watchdog/{renesas-wdt.txt => renesas,wdt.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> rename to Documentation/devicetree/bindings/watchdog/renesas,wdt.txt
> -- 
> 2.11.0
> 
