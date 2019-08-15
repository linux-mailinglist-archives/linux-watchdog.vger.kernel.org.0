Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7081D8F327
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731603AbfHOSVf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:21:35 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35600 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731537AbfHOSVf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:21:35 -0400
Received: by mail-pf1-f194.google.com with SMTP id d85so1743600pfd.2;
        Thu, 15 Aug 2019 11:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+zin5GlnhSNH+SOpEU9khhnTmInFEF1UEDwKlB5C9kA=;
        b=NM3/XVGy9SF1jaOxiVpiItX5VfkWoZN2fUxinb4xMbPEBPkNwhKWY8Dp/309ZW8yXC
         jN8dXnlqxKjUP8936OMbskSk1i3laVJ1iMYZsBdw7MiA68MZkIaGATe7S2Ah+MYnYIxO
         A2+dBuNNniiDlOZSDpBHW+TiI3olQddjLconyXHCdzG+MKMX7V8W++HrcOWR/e0dd4io
         BDlHJiXLLJXCGwPGrudVDJsZs4+AAZdSf/9uKLkx2qc3hvNM+e6pPBug0NjegV0qsohC
         119kvupu/v0jkzmix3eLnHnu9cNO5LdteQHf9EG/QGQXN81hQHSXkDWRZZDN5kL8zZPL
         f+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=+zin5GlnhSNH+SOpEU9khhnTmInFEF1UEDwKlB5C9kA=;
        b=VJ5frl8r9kI6RwhK32IoRvoQi4/sxbY9M4TZ2vTVCfaEGDrvQcPFC477Ns+9xtrLbb
         HdPGAWIB4aow+6EAxYwUGioRdOs3MpN65fkjxU+Hr4SqAJopk+Rsgi1nWfj9/BnSsoI7
         poLgNVKxUPJG3Scya9xitGiq9DOHzndUKr/FFidyU1m/pEPvObit7DhNkr0dmqcXQLES
         4fphztg0bg/66+HWfulESpXr73fzgYHT03Kg3Zhq91IorA4Dytq58ZOSseA/3MZ68S4j
         Nh/D65+QOQDlGOFb2YKhqWzKnxfFlXDPPMNhKet6satXz0zt1Rtjf5CvkQ+Fv/Bf9r6+
         9hgg==
X-Gm-Message-State: APjAAAVf8dzzwbfV4NtgqXAFlOm6FWpK9ilBPULW9NKGjbY+VEqZo0hQ
        /Gnh0H7c+e9+POuTEMIW29o=
X-Google-Smtp-Source: APXvYqx9xGc4TT6bQ/YTud9tbTwe0CxuDxND95fhSIIhxSN8yG01XmJqeuaXxw3p7z8DFq1ipwVAFQ==
X-Received: by 2002:a62:f208:: with SMTP id m8mr6572323pfh.108.1565893294902;
        Thu, 15 Aug 2019 11:21:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f27sm2763485pgm.60.2019.08.15.11.21.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:21:34 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:21:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/22] watchdog: ziirave_wdt: Don't try to program
 readonly flash
Message-ID: <20190815182133.GJ14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-15-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-15-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:58PM -0700, Andrey Smirnov wrote:
> Bootloader code will ignore any attempts to write data to any flash
> area outside of [ZIIRAVE_FIRM_FLASH_MEMORY_START;
> ZIIRAVE_FIRM_FLASH_MEMORY_END]. Firmware update code already have an
> appropriate check to skip those areas when validating updated
> firmware. Firmware programming code, OTOH, does not and will
> needlessly send no-op I2C traffic. Add an appropriate check to
> __ziirave_firm_write_pkt() so as to save all of that wasted effort.
> 
> While at it, normalize all of the address handling code to use full
> 32-bit address in units of bytes and convert it to an appropriate
> value only in places where that is necessary.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
