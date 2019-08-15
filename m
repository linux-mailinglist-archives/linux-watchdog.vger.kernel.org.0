Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE6CE8F347
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730920AbfHOSZC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:25:02 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34879 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbfHOSZC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:25:02 -0400
Received: by mail-pl1-f195.google.com with SMTP id gn20so1372730plb.2;
        Thu, 15 Aug 2019 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tUCC205/k2NpCbbKpNSZh2FstIsrHIBqKqoj8pLlYoA=;
        b=QvWGvwC3cbqBAYic+mI1BTsXf9DZBpB5/kgC4OGMFCum7D6mxuWBsC8GY5wOCbNhal
         WZnJ0D7QK+aOnKrT66Dnwc6FvQMqSdcYzcwR8RF+Vu5T9ECcMwc8JoweLG5oilzsOcWP
         EOf43zTcSZ/w/N87LDibeaPm7ELSWVG3DDqhD/QF+hvciPnXVmke0dPeX+P04olUG+fc
         hT6qgrcWhwb7hIwG8yI1+DF9Kly+8pEwg9Wf6adW1BahE7ZqTC44iDbMjP1TninEgN2I
         d5yMAusthF31XvvAZcNJISus5otYk/+OW8jsidZ3cST57g3zzMeHlN8I9rv93zgdzeHE
         FNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=tUCC205/k2NpCbbKpNSZh2FstIsrHIBqKqoj8pLlYoA=;
        b=HRT0gSdo5ktJIB8ORyAKMKlfG204xeJ3F7IkYnz8991oZdFslWQ8hyRXeXorLlMQcB
         V3X3t/X4albkz0qpMZXqXiJL7VkVNdSuprGvwRLnQivOSb0Wqp8bvP8zjyUNmIpQAj+4
         ilcNICMfuf+8QFK0fOrPjb/xH6V/V4sDkMPzwkYirvISVEAOpCHHR2ozJORLLAltnpkU
         UpFEmBDIxfUb283E3jPuqxCMeurkxUTe8i/EBka/XTIjjmHK8U10BqkTF0fTofEOKT+L
         /3hnkVTeCb8irqA3phkd5+/TQwnKdl6cztmT8RMbRy42iVI85jxdWop4h3arKsS+UoLH
         HCFg==
X-Gm-Message-State: APjAAAU658hEDGUNjdEthWl1NELcbzV0YXjJVWfBfE8W1lH6a8OzT0qL
        kLEsuLuJXBbHVv6hhM+V0SE=
X-Google-Smtp-Source: APXvYqwy2BIlYg6t8jYBljRC34feZ76UerOGmrtnRgV+nhbhHXPYa6nSiktIPKGq2KCTMaZU9WybBQ==
X-Received: by 2002:a17:902:bc41:: with SMTP id t1mr5609218plz.171.1565893501983;
        Thu, 15 Aug 2019 11:25:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f26sm4025706pfq.38.2019.08.15.11.25.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:25:01 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:25:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 21/22] watchdog: ziirave_wdt: Drop
 ziirave_firm_write_block_data()
Message-ID: <20190815182500.GQ14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-22-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-22-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:09:05PM -0700, Andrey Smirnov wrote:
> There's only one user of ziirave_firm_write_block_data(), so we may as
> well inline it.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
