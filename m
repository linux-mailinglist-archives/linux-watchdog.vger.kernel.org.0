Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8E537510A
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 10:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbhEFIsZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 04:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22956 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233832AbhEFIsY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 04:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620290846;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KRIn6MQisNyLZZ3un1MN0Pyrf/x2u4ROIjZCBtc/1Es=;
        b=cpT0KYZlT0tyjUJO1k9T33xbS8ds1nFFZBEbDr+iBwfLdTM4XaTAfGI0WIadDSMGvBlAxm
        RP28vYEU0lvEkUEkJOgS+RotrLpmPMct2rXm73xjiJY3sQUuaH1QCwq/HZ+v2lWCoRo5S4
        rSp2yHIZ5ZpY/r+DPjqKWbFW8gZgRO0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-_4FVkUTrPI677yf-8lRUEQ-1; Thu, 06 May 2021 04:47:24 -0400
X-MC-Unique: _4FVkUTrPI677yf-8lRUEQ-1
Received: by mail-ed1-f69.google.com with SMTP id f8-20020a0564020688b029038840895df2so2266053edy.17
        for <linux-watchdog@vger.kernel.org>; Thu, 06 May 2021 01:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KRIn6MQisNyLZZ3un1MN0Pyrf/x2u4ROIjZCBtc/1Es=;
        b=Q7MEYRxQefQVPDfU5aSIxg0mKXQXRq3w04kSqO/YRiMQTUGtmoh51iGOecZH1+701r
         N3T+8pPugKNUU/JR3/ZT73QVZEkl8FQR7GuaZlKheGiNgpisGok4QdTSB+CdQNcKsj8f
         rjgYEbCM/SFNC+i6stNr+QwlRg/uRvlHDDmhhtxUYTgKn6I+gNMQhcrdCQSspXiQeIBL
         vv2j9e9bmmQPjIP1lLcCTI8p0tfF2H9aAzjsEldy3l5BvW1wniuOBlYmn/nzHexxoBVf
         moGJVZL575rhI2NwjjBla/0IvlfLQzL3G4iFVMGjmDUucbrGH/BeFkCK1M0W3Sl/Hf8d
         i9tA==
X-Gm-Message-State: AOAM531JjidL4YZZ2qIuUAF2INiWSvA5KMFcjMnz1wYkJEIsTMayrpAU
        zZEwcDIuEff7t7wSYFO1AIPOfK0uodBG+uG2XM3fcioDix0lEqFzLyW+WbZSCQCoPDNtYz71aQv
        GFU1FQYjiYJ2c8ylir1i7Mhw/WG4=
X-Received: by 2002:a17:906:b1cc:: with SMTP id bv12mr3139439ejb.407.1620290843609;
        Thu, 06 May 2021 01:47:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5WRJKGPMKVmDFF5BwJVdGJUqxr4ZQ+H+x9+d7+GGOMWKY0RO66B9rNI18XTyDb9a6RlsqdQ==
X-Received: by 2002:a17:906:b1cc:: with SMTP id bv12mr3139419ejb.407.1620290843387;
        Thu, 06 May 2021 01:47:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v16sm1092562edt.53.2021.05.06.01.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 01:47:23 -0700 (PDT)
Subject: Re: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded
 controller entry
To:     Campion Kang <campion.kang@advantech.com.tw>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        AceLan Kao <chia-lin.kao@canonical.com>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6b86bd36-b934-c204-9e56-079ab8cd4b54@redhat.com>
Date:   Thu, 6 May 2021 10:47:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506081619.2443-1-campion.kang@advantech.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

I'm replying here since this series has no cover-letter, for
the next version for a series touching so many different
sub-systems it would be good to start with a cover-letter
providing some background info on the series.

I see this is binding to an ACPI device, yet it is also using
devicetree bindings and properties.

So I take it this means that your ACPI tables are using the
optional capability of embedded device-tree blobs inside the
ACPI tables ?

That is an unusual combination on a x86 device, note it is
not wrong but AFAIK you are the first to do this on x86.

Other then that question, for the next version please give
all commits a proper commit message and not just a short
1 line Subject and put the changelog after a scissors line
after your Signed-off-by like this:

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
Changed in V7:
1. According to the reviewer's comment, add two files:
   Documentation/hwmon/ahc1ec0-hwmon.rst and
   drivers/platform/x86/ahc1ec0-core.c

And please also include older changelog entries.

Regards,

Hans
 




On 5/6/21 10:16 AM, Campion Kang wrote:
> Changed in V7:
> 	1. According to the reviewer's comment, add two files:
> 	   Documentation/hwmon/ahc1ec0-hwmon.rst and
> 	   drivers/platform/x86/ahc1ec0-core.c
> 
> Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83c2b1867586..984795eb6b5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -572,6 +572,19 @@ S:	Maintained
>  F:	Documentation/scsi/advansys.rst
>  F:	drivers/scsi/advansys.c
>  
> +ADVANTECH AHC1EC0 EMBEDDED CONTROLLER DRIVER
> +M:	Campion Kang <campion.kang@advantech.com.tw>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
> +F:	Documentation/hwmon/ahc1ec0-hwmon.rst
> +F:	drivers/hwmon/ahc1ec0-hwmon.c
> +F:	drivers/mfd/ahc1ec0.c
> +F:	drivers/platform/x86/ahc1ec0-core.c
> +F:	drivers/watchdog/ahc1ec0-wdt.c
> +F:	include/dt-bindings/mfd/ahc1ec0-dt.h
> +F:	include/linux/platform_data/ahc1ec0.h
> +
>  ADVANTECH SWBTN DRIVER
>  M:	Andrea Ho <Andrea.Ho@advantech.com.tw>
>  L:	platform-driver-x86@vger.kernel.org
> 

