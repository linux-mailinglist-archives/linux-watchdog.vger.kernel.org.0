Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B5F1CE36F
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 May 2020 21:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731249AbgEKTAI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 11 May 2020 15:00:08 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36588 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731014AbgEKTAH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 11 May 2020 15:00:07 -0400
Received: by mail-oi1-f193.google.com with SMTP id x7so15148475oic.3;
        Mon, 11 May 2020 12:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3OQElmdEf6ANxO9yWCHx08jhkcCE6GTH6WxnqucsYS4=;
        b=hDyuoXHR1Qq/cye5pJ66z5UoeyQSoNG1db+bhOh+9A0gpB+BLOVux6NKXsUMJKWGZ0
         0K+bLE1H8avv8GacU+dMJLjCizFYr1Yny6LlyB1aYnLVHkCO8VBSw22VGmPnwgtR7Kz/
         ZbTjzoCwbQnukEwRsAWWR6dXnLicDFv5rthn6Kn9y6PHooMWi3p2FFQsHCITBEYkdZ9b
         60/uPIuPIIrp2qbBRl3K1ViYhSUpkYFT20OglsXnWgBoz/24z6074dOjS9/kHqTWrYW5
         H1p+vsCyigFqDOFhKBo86TLn2GI43sGAD+BBwK4BHkDC1T+mAC8sIgtoNNY26nkmH0Qc
         bKRQ==
X-Gm-Message-State: AGi0PuZz9vFUOx3YPVrAVaLiIPnlSKMOwDrsOil+vQRPMv2GFj7P7Zrj
        lQkCwxdLdG8fy0cFIMFPXw==
X-Google-Smtp-Source: APiQypIlbJwELJ7ratpU0IUXyqMjaII4UKvwSaScvVnUdGMDRLxrcwTHhlisxm9GrChX2KpbzKWLxQ==
X-Received: by 2002:aca:c613:: with SMTP id w19mr19787064oif.114.1589223605738;
        Mon, 11 May 2020 12:00:05 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l89sm2332076otc.32.2020.05.11.12.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 12:00:05 -0700 (PDT)
Received: (nullmailer pid 7490 invoked by uid 1000);
        Mon, 11 May 2020 19:00:04 -0000
Date:   Mon, 11 May 2020 14:00:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Linux-imx@nxp.com, robh+dt@kernel.org,
        linux-watchdog@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux@roeck-us.net,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 2/2] dt-bindings: watchdog: Convert i.MX7ULP to
 json-schema
Message-ID: <20200511190004.GA7369@bogus>
References: <1587478886-21512-1-git-send-email-Anson.Huang@nxp.com>
 <1587478886-21512-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587478886-21512-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, 21 Apr 2020 22:21:26 +0800, Anson Huang wrote:
> Convert the i.MX7ULP watchdog binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V2:
> 	- drop clocks description;
> 	- drop unused label;
> 	- improve timeout-sec.
> ---
>  .../bindings/watchdog/fsl-imx7ulp-wdt.txt          | 22 --------
>  .../bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 60 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> 

Applied, thanks!
