Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9302B8E5
	for <lists+linux-watchdog@lfdr.de>; Mon, 27 May 2019 18:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfE0QWH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 27 May 2019 12:22:07 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36918 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfE0QWH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 27 May 2019 12:22:07 -0400
Received: by mail-pg1-f193.google.com with SMTP id n27so9344090pgm.4;
        Mon, 27 May 2019 09:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AuU25hUL3EWXZK1Tzh1llJtlTYBESpf2jTuIjHi6EjM=;
        b=ZuhnfL0jzh+0ekehRLuHntrncgRQgmbhSr2TpBcwOJG52FNHplYzOhZ47df/OHvL79
         Seyc1AeW4t+LtyMs2fMR9fmJMmrwP7/a0RT6R8YVyk30U7WoIuiEahO9Y3ZUMjEh/I4q
         Ri2uHYSUKT7u3YMyAn1DiQKBgc9nefB4Jx+pJOv+mRWDG9lruBo0SsOp9OScdRFVPQNu
         2NCINZicBPW6GOWo861YDUmhKh/t2XMaSx2+3tJU8mNFKY69MQQpRWAMF3BZtQDa9DWZ
         RfmtH2j2GyPVrVCacRKoHHiDGm3ISLXUljnHDlKhMaoQt64TiaaYQJiIxDVa3avTfbBI
         6YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AuU25hUL3EWXZK1Tzh1llJtlTYBESpf2jTuIjHi6EjM=;
        b=aMMTvyEESwH0huOYD7oisTFIUHv1F7UfZeikCii6VYw0B4UnYQBYu1bnIC/4uERtC0
         bv6mxZlQf5EmXinrL+Z1bdHwcal4MdiQqXqDdlkbd23CoiukZNooTctFYJSU7iaHanlm
         c+Yv865aPvgCHZxWrb/5L3VOydHyIoF6TUyb2AVF3+GgNqqe9cnHb5FhQxEsCWl/WRo5
         tSTEzNGEGmrvlMnYsTDNdH1Ur+HbPXzo1YOf1+DXPcDz091ZE4CefAcQjnXXc2J2N5MD
         VMB+LMNktfHyMfn2kB9sKxHHHaRUURzsedU502KEgSNdVN4ombkyPAePCp/7M/q3/8WM
         WxCw==
X-Gm-Message-State: APjAAAUwXszmO/TVt21u8Kje9URfs3bVYctJdAM4z701GN8qsOsoYN2f
        OR/oxBbjCGXFOinHyltFcl4=
X-Google-Smtp-Source: APXvYqxRD56RSgal1/lI+HdxqMWYpNm06dcOrY4uJUjA/LuLLal8f5oUziWfqJpriU/OdqqmaZ/wAA==
X-Received: by 2002:a63:1f55:: with SMTP id q21mr66676028pgm.51.1558974127045;
        Mon, 27 May 2019 09:22:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i3sm9982898pju.15.2019.05.27.09.22.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 09:22:06 -0700 (PDT)
Subject: Re: [PATCH] watchdog: renesas_wdt: Use 'dev' instead of dereferencing
 it repeatedly
To:     Wolfram Sang <wsa@the-dreams.de>,
        Nguyen An Hoan <na-hoan@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        wsa+renesas@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        cv-dong@jinso.co.jp
References: <1558603778-20848-1-git-send-email-na-hoan@jinso.co.jp>
 <1558603778-20848-2-git-send-email-na-hoan@jinso.co.jp>
 <20190523110649.GB3979@kunai>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a0919587-7a42-b998-ae05-9d8e4ddf6e4c@roeck-us.net>
Date:   Mon, 27 May 2019 09:22:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523110649.GB3979@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/23/19 4:06 AM, Wolfram Sang wrote:
> Hi,
> 
> On Thu, May 23, 2019 at 06:29:38PM +0900, Nguyen An Hoan wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> Add helper variable dev = &pdev->dev
>>
>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> 
> Hmm, I leave the decision to Guenter. Dunno if there is a subsystem
> preference. I personally don't think it adds value but I am not against
> it.
> 

I like it because it makes the code easier to read.

Guenter
