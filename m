Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68906C43BE
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Oct 2019 00:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfJAWVO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Oct 2019 18:21:14 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41081 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfJAWVO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Oct 2019 18:21:14 -0400
Received: by mail-io1-f65.google.com with SMTP id n26so23714596ioj.8;
        Tue, 01 Oct 2019 15:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tqpZqSWBzevFiWNRX1d50Nxn4Q6kEMJVfz95i9zh0jU=;
        b=eiRtJXcj5tIrhtDKARyXPiAegQ4tyjJqmXaIRktRTplQVatwzRUdsalJBOxAN1gPjQ
         qO/Ih6EjTa/BzI4m/YfpIOo2WRXqXD5d2ZoyrRSLEGnnWkeTUY+BitIzU8/Y5mesAtRR
         LHnYfMQySljydKju3W+YY4CUGnc3tkUJ9wgYy7FWoz/rqLguAdC4OoCZSQker9/HMIEz
         f5tvYlUJcvs/Zj/8KUGaAWXKddPeIgDfAJGz3AV7sgk+yN72vxu2GImBgv0jaLjaPpFa
         N3xGMUkrjBi2r1W6bpb47Ew8S29AoYruSYTIDiAK20W1U7+0Z6HU+rtD6I9K4grLaqO5
         WV6A==
X-Gm-Message-State: APjAAAXaqw/1kDHCEhJt/clL/aVSitWMfrJkbeifO4bSepPIwC9DpHrT
        atkp2Avhi/ocsw2TfYG92/uMSCQ=
X-Google-Smtp-Source: APXvYqxO5LTPz9sKvdwvDzGXEOAzX1TntNU8CChdjjgJOYUb3Q3B/TxouQGgOk9y7bFjc+A4UCmazA==
X-Received: by 2002:a5e:c814:: with SMTP id y20mr501581iol.88.1569968473151;
        Tue, 01 Oct 2019 15:21:13 -0700 (PDT)
Received: from localhost ([2607:fb90:1780:6fbf:9c38:e932:436b:4079])
        by smtp.gmail.com with ESMTPSA id p20sm7826300iod.43.2019.10.01.15.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 15:21:12 -0700 (PDT)
Date:   Tue, 1 Oct 2019 17:21:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
Message-ID: <20191001222109.GA26050@bogus>
References: <20190920162124.7036-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920162124.7036-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Sep 20, 2019 at 06:21:22PM +0200, Krzysztof Kozlowski wrote:
> Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Remove unneeded timeout-sec description and include generic bindings.
> ---
>  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
>  .../bindings/watchdog/samsung-wdt.yaml        | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
