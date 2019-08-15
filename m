Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA668F2FD
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732000AbfHOSO4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:14:56 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35483 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731200AbfHOSO4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:14:56 -0400
Received: by mail-pg1-f194.google.com with SMTP id n4so1649083pgv.2;
        Thu, 15 Aug 2019 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HLIOD3t9amh3H3ELI3Zso3BPNbnL8HE4UOs7yecTIp0=;
        b=a7Y9E7xJ6QXpWsPl4qxhVdlfK/SUymH9/XrJngOwi8irJEDQV5RTzrIrXWYXYJiqTJ
         iAqe6bQgBHhAOAIOH1AqRcQ1jFy+hSbitLgJv0YQsQOfHW1xGjkEx4Dv1rv7z5uGoxJT
         y9O18HoEVLxJnLnPXdCLUeRsS+XyVS8uQaSfH0OQizCpRNtc0VACiuC9qqbwDAMG06QX
         uFf9J/mQnHlEPVpalgUBeglYAP+qKHOTliJwwaznsrXYAfJvJZLPr6cSpZIYzlfiqQro
         yTrHmLJf7+BN0CsLDLKLTYTXbPQueCXCVLA5t7lMt5nCpIZmrJyUAHCAzY4Tg1BBmLPZ
         HPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=HLIOD3t9amh3H3ELI3Zso3BPNbnL8HE4UOs7yecTIp0=;
        b=K7Sd2UPGBv1DE0a2drL7GmricqQuzdaRnbtmZYPN8QOvPJ3tnUxtOYHe3kFZMHeptV
         3yuYcpK0mBM7Cgo02ZwUM3fvWJndfbyiMDzgghi5iknqyWi9ZTjHisP3b5qkpHLXQftZ
         vSuHsbM9pwx/fP3+56nrzFqvy/LprYa0ThKqPXJAuUkpzs4l1KQZnIT4PHvR+ANJMlp4
         2dx95nQOGQG4dE71sU1S0h4L9uqVUHV5i/Rt5EQokCtpDTJo6TUg4sOUtGaB2b81st0f
         hXpGWH9n15crsDk9MWilo818J41QAuOaetgPA9deEZLWbBVTPBQvZr7ft+E4Agx/Wrr3
         woHQ==
X-Gm-Message-State: APjAAAVtblPE47ppGKVDUK6zU8df3a/IhCJs2pTme7DLX5ctNp2szQz4
        ffpFoQz0xuX2lQ19zrQTp1w=
X-Google-Smtp-Source: APXvYqw4pm6EOHy/RuB04FbFtwXTTFd3nshGxlMhjpm8kAp2eH2zHaOL03wfUWiJT94xFRPjWJbdwQ==
X-Received: by 2002:a65:6448:: with SMTP id s8mr4500348pgv.223.1565892895286;
        Thu, 15 Aug 2019 11:14:55 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u18sm3546935pfl.29.2019.08.15.11.14.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:14:54 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:14:53 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/22] watchdog: ziirave_wdt: Check packet length only
 once
Message-ID: <20190815181453.GC14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-8-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-8-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:51PM -0700, Andrey Smirnov wrote:
> We don't need to check for packet length more than once, so drop the
> extra check in ziirave_firm_upload(). While at it move the check at
> the very start of __ziirave_firm_write_pkt(), as to not waste any time
> preparing a packet we'll never use.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
