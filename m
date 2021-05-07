Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4474375E0B
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 May 2021 02:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhEGAvI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 20:51:08 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:45992 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhEGAvI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 20:51:08 -0400
Received: by mail-oi1-f181.google.com with SMTP id n184so7200179oia.12;
        Thu, 06 May 2021 17:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AatibMOA4li3CEKliirVfNvmikRqrNF2aRa+qxSbEeU=;
        b=uDQ2e7M7xS/NSb81HMI3UBi8rHTS3zgPnqXKfoQ2VKISsgJ/W2M3aYPTjTFnPbE/nG
         7LZh0Hyt6BiDbxsZi2yjut2ptiLLIOMqq2vCBTQEeIY5C2TXCElfqS7d0dcNor31b8rA
         c+SUArSLGh7+k7aBdtS2UY4FIWcOEcdHuOnJiTkdP3kU6xbB5Y0uA/lFcoZMlzB2fq2B
         26GsVH4sDmWR/pUySuvOMED+HPtpqb/eE3joBsq+V3nWZpHC1zsB7Z35z5m2yDwWVRCV
         Epdbpn+zUlYlkW4sRprIpSPlg2/tYb97sb3+aLO05QDFkntLLg4kYI2BO1yvT2ZLOTwe
         GkOA==
X-Gm-Message-State: AOAM531DlC7Eo8Q6/rLx5j1xH++sb4j1TYy/DtJKMeZsTQk4G2GBGCue
        tlp7IG9odhFIyUszUGO78qO2NfNC1g==
X-Google-Smtp-Source: ABdhPJxhLgGETpHSMwcVoV7CyaAQ8SZKnS58vrwPhF76bcec4Vpykg2hPc3hfxvLcP44hmxF3nc3Ng==
X-Received: by 2002:aca:6088:: with SMTP id u130mr13045856oib.51.1620348609095;
        Thu, 06 May 2021 17:50:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r17sm821604oos.39.2021.05.06.17.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 17:50:08 -0700 (PDT)
Received: (nullmailer pid 1093815 invoked by uid 1000);
        Fri, 07 May 2021 00:50:06 -0000
Date:   Thu, 6 May 2021 19:50:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Campion Kang <campion.kang@advantech.com.tw>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded
 controller entry
Message-ID: <20210507005006.GA854303@robh.at.kernel.org>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
 <6b86bd36-b934-c204-9e56-079ab8cd4b54@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b86bd36-b934-c204-9e56-079ab8cd4b54@redhat.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, May 06, 2021 at 10:47:22AM +0200, Hans de Goede wrote:
> Hi,
> 
> I'm replying here since this series has no cover-letter, for
> the next version for a series touching so many different
> sub-systems it would be good to start with a cover-letter
> providing some background info on the series.
> 
> I see this is binding to an ACPI device, yet it is also using
> devicetree bindings and properties.
> 
> So I take it this means that your ACPI tables are using the
> optional capability of embedded device-tree blobs inside the
> ACPI tables ?

Ugg, really. I would have stopped caring if I had realized.
