Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9F58F32A
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbfHOSWZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:22:25 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37750 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729565AbfHOSWZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:22:25 -0400
Received: by mail-pg1-f195.google.com with SMTP id d1so1053011pgp.4;
        Thu, 15 Aug 2019 11:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=txZJhNxrapMvmOTZASBoijQbwLTB6aLporkc5P4ul5U=;
        b=B26Jh0PjbOXfLL3r9dKLcd+6AYHTkSJKrEarIm//974w52DHLIOR13Iz/AxRlaUoPp
         5PX5R5sffUhm/9a9n8YciArOOhsOW7sWJGKl/9GUnA1A04+li9Ic+rBNTuekweuO69rU
         nDL0d+ycL/qGB0dKIYyfAMXLIrPu0fE9OE42vTA9jjHvmrVlCqK+Mr6oNBFvrnU+aoCk
         WI7sJZ8WH9lztTakzXBy3xWJ1pcAVj2PTFKPgAYF54RnJWPWiRrOCU+2e94kmPN0Daet
         p/3of0H1RB+szZo1NCgHaGHtGz1RpM4KIpM9XTxjTR7J3kCj10FkSbUmBdoNi480fm8r
         ZqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=txZJhNxrapMvmOTZASBoijQbwLTB6aLporkc5P4ul5U=;
        b=DlPRfZC97YDFtG696/GWEtrap2ju1sTTeuzxRddP8bHEFuUQNHToWwsYXGFRXlbSD0
         jtl0+oum9KiCm6oavtSAXQL54H202+X5Ybni3tba4RpO8Joga57RrP0Apgw2Z7UwaOPa
         gwlwit++X2oUjUemfyEzUrlDJwHWDXMP5LysCFCFI4NZriWs40WvmWMeX6ojb+8g2zt+
         Ta7q6pmAR5YZZ4GaqPJa0slPrn6yQCwHJDxTT/xui1TNuIglu/7vgkyT8hg14vq+K/Xg
         HalR+7DT4UUrL2VCRr/qYCMFimk1XEB0SsJixFtdzjNPocIg+XgMkqZFJ3DqjaoRs/Th
         wwWQ==
X-Gm-Message-State: APjAAAXpoPmmdAiAVT2D6irkjGQmp+trIVfbwslwhGkBfmsKxQTXRoRT
        ltze8VZGCS5nD41F9t+SGjo=
X-Google-Smtp-Source: APXvYqzJdmxmVzEvTX3RmbRlwbIprIcdEcvlrN0RrNABRSDD+ZOnrjp6rlJlhKJNV/R8twPFhLzWFA==
X-Received: by 2002:a62:7d0d:: with SMTP id y13mr6553914pfc.150.1565893344413;
        Thu, 15 Aug 2019 11:22:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m125sm2779240pfm.139.2019.08.15.11.22.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:22:23 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:22:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/22] watchdog: ziirave_wdt: Fix misleading error
 message
Message-ID: <20190815182222.GK14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-16-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-16-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:59PM -0700, Andrey Smirnov wrote:
> Fix misleading error message in ziirave_wdt_init_duration(). Saying
> "unable to set ..." implies that an attempt at communication with
> watchdog device has taken palce and was not successful. In this case,
> however, all it indicates is that no reset pulse duration was
> specified either via kernel parameter or Device Tree. Re-phase the log
> message to be more clear about benign nature of this event.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
