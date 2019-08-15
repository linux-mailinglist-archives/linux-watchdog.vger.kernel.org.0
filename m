Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAC528F30F
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 Aug 2019 20:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730869AbfHOSSj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 15 Aug 2019 14:18:39 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35768 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbfHOSSi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 15 Aug 2019 14:18:38 -0400
Received: by mail-pg1-f193.google.com with SMTP id n4so1653559pgv.2;
        Thu, 15 Aug 2019 11:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ecKrcpb9LcTu8OCQhSAoU83cUuL9rJFxNzgFSkgiqxc=;
        b=PiQAa4/ADT+idQL74Xbd4I21diVXnHrZJH69WFvJJssq2C5Rpk8dFs9L4dtJLC5P3e
         hpoEP5RgPcap5mjBbgrAlqTSKGykDTYy3inyjkrMQvL/Mts35ScFe8VE0i2+8lZOzca4
         /euyiXVGlT+SqkrHWL9F621fp/dSWeARBqzE2/MDmKQ05Ozxj+nMGBuK8FRioLv7P2C/
         049dgQNHv9Fwwf/0uoU0zHPanhlEM98+LkA2H0TeNsub2rr4WlJ3bQhr0v9RvgLlzjpO
         Kzh7C6UcezU9iIFCLEZIOXvP3l2METGAN2hM8+bbgri3YDBplR78U46qdBrC39PUZ9px
         uvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ecKrcpb9LcTu8OCQhSAoU83cUuL9rJFxNzgFSkgiqxc=;
        b=Gua2NTzEGEij5eAOEA3p8pb16dGgPfcQEfqk9nle0ACccyPwCj49y0wI8eiQe/hgk2
         UxzHq4IykNWPP5m5vWlwNvqP3v+rdXxmhhjW0jQ5hRXZN2B8OcflSzF/8QSwvWC5vza6
         SOiOwCT3YkiG2BdTq+JnU1oySzE1tV3ydx2OspUYzKhL5cJAChPHyWxZ2RjdZmBRIcE/
         EfsN3R7hN6pSYp27ga6M/fsrLb7DmcSRvIpM+I8UIDTtjeZX2OeL/doF/asOY1qqRjp/
         Lm5jJh+m1zxYOe2tpKqKKADqRARshx1DNLGXr9qMqa6La4rE9Wt59Z0KvSzvFF/FnonE
         L44g==
X-Gm-Message-State: APjAAAUkEmiwHtharIvIhRfHEznHIaoy3uqNmwmjZBlEeC+uPm+PbUpF
        Jy2oehqz3/BmXin7MYq0laShy/xs
X-Google-Smtp-Source: APXvYqyL+/K2nW8mUU1deWnYAXlaW0TDkeGdxlv+Q7oJnb+Gv+mATMVjbeN0lUdkRFeVL/TnoZVVnw==
X-Received: by 2002:a63:61cd:: with SMTP id v196mr4578199pgb.263.1565893118214;
        Thu, 15 Aug 2019 11:18:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p3sm1854733pjo.3.2019.08.15.11.18.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 11:18:37 -0700 (PDT)
Date:   Thu, 15 Aug 2019 11:18:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/22] watchdog: ziirave_wdt: Make use of
 put_unaligned_le16
Message-ID: <20190815181836.GG14388@roeck-us.net>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
 <20190812200906.31344-12-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812200906.31344-12-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 12, 2019 at 01:08:55PM -0700, Andrey Smirnov wrote:
> Instead of doing this explicitly use put_unaligned_le16() to place
> 16-bit address value into command payload.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Chris Healy <cphealy@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rick Ramstetter <rick@anteaterllc.com>
> Cc: linux-watchdog@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

